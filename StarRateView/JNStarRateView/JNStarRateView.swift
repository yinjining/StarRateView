//
//  JNStarRateView.swift
//  StarRateView
//
//  Created by iOS Developer on 16/9/19.
//  Copyright © 2016年 yinjn. All rights reserved.
//

import UIKit

@objc protocol JNStarReteViewDelegate{
    //返回星星评分的分值
    optional func starRate(view starRateView:JNStarRateView,score:Float) -> ()
}

//星星评分规则：1颗星==1分
class JNStarRateView: UIView {
    var delegate:JNStarReteViewDelegate?
    var usePanAnimation:Bool = false//滑动评分是否使用动画，默认为false
    var allowUnderCompleteStar:Bool = true{//是否允许非整星评分，默认为true
        willSet{
            self.allowUnderCompleteStar = false
            showStarRate()
        }
    }
    var allowUserPan:Bool{//defualt is false,true为滑动评分
        set{
            if newValue {
                let pan = UIPanGestureRecognizer(target: self,action: #selector(JNStarRateView.starPan(_:)))
                self.addGestureRecognizer(pan)
            }
            _allowUserPan = newValue
        }get{
            return _allowUserPan
        }
    }

    private var starBackgroundView:UIView!
    private var starForegroundView:UIView!
    private var _allowUserPan:Bool = false//默认不支持滑动评分
    private var count:Int!
    private var score:Float!
    private var firstInit:Bool = true//是否是创建view
    
    /**
     * 一颗星代表一分
     * starCount:代表创建多少颗星
     * score:创建时显示分数
     * 默认的是5颗星，0.0分
     */
    override convenience init(frame: CGRect) {
       self.init(frame: frame,starCount:5,score:0.0)
    }
    init(frame: CGRect,starCount:Int,score:Float) {
        super.init(frame: frame)
        self.count = starCount
        self.score = score
        self.clipsToBounds = true
        createStarView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func createStarView()->(){
        starBackgroundView = starViewWithImageName("backgroundStar.png")
        starForegroundView = starViewWithImageName("foregroundStar.png")
        self.addSubview(starBackgroundView)
        self.addSubview(starForegroundView)
        showStarRate()
        self.firstInit = false
        //添加手势
        let tap = UITapGestureRecognizer(target: self,action: #selector(JNStarRateView.starTap(_:)))
        self.addGestureRecognizer(tap)
    }
    private func starViewWithImageName(imageName:String) -> UIView {
        let starView = UIView.init(frame: self.bounds)
        starView.clipsToBounds = true
        //添加星星
        let width = self.frame.size.width / CGFloat(count)
        for index in 0...count {
            let imageView = UIImageView.init(frame: CGRect(x:CGFloat(index) * width,y: 0,width:width,height:self.bounds.size.height))
            imageView.image = UIImage(named: imageName)
            starView.addSubview(imageView)
        }
        return starView
    }
    //滑动评分
    func starPan(recognizer:UIPanGestureRecognizer) -> () {
        var OffX:CGFloat = 0
        if recognizer.state == .Began{
            OffX = recognizer.locationInView(self).x
        }else if recognizer.state == .Changed{
            OffX += recognizer.locationInView(self).x
        }else{
            return
        }
        self.score = Float(OffX) / Float(CGRectGetWidth(self.bounds)) * Float(self.count)
        showStarRate()
        backSorce()
    }
    //点击评分
    func starTap(recognizer:UIPanGestureRecognizer) -> () {
        let OffX = recognizer.locationInView(self).x
        self.score = Float(OffX) / Float(CGRectGetWidth(self.bounds)) * Float(self.count)
        showStarRate()
        backSorce()
    }
    
    //交互后反向返回分数
    private func backSorce(){
        if (self.delegate != nil) {
            var newScore:Float =  allowUnderCompleteStar ? score : Float(Int(score + 0.8))
            if  newScore > Float(count){
                newScore = Float(count)
            }else if newScore < 0{
                newScore = 0
            }
            //协议代理
            self.delegate?.starRate!(view: self, score: newScore)
        }
    }
    
    //显示评分
    private func showStarRate(){
        let  duration = (usePanAnimation && !firstInit) ? 0.1 : 0.0
        UIView.animateWithDuration(duration) {
            if self.allowUnderCompleteStar{//支持非整星评分
                self.starForegroundView.frame = CGRect(x: 0,y: 0,width: CGRectGetWidth(self.bounds) / CGFloat(self.count) * CGFloat(self.score),height: CGRectGetHeight(self.bounds))
            }else{//只支持整星评分
                self.starForegroundView.frame = CGRect(x: 0,y: 0,width: CGRectGetWidth(self.bounds) / CGFloat(self.count) * CGFloat(Int(self.score + 0.8)),height: CGRectGetHeight(self.bounds))
            }
        }
    }
}
