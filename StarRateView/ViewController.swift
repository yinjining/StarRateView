//
//  ViewController.swift
//  StarRateView
//
//  Created by iOS Developer on 16/9/19.
//  Copyright © 2016年 yinjn. All rights reserved.
//

import UIKit

class ViewController: UIViewController,JNStarReteViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let starView = JNStarRateView.init(frame: CGRect(x: 20,y: 60,width: 200,height: 38))//默认的是5颗星，分数为0分
        let starView = JNStarRateView.init(frame: CGRect(x: 20,y: 60,width: 200,height: 38), numberOfStars: 5, currentStarCount: 3.4)
//        starView.isUserInteractionEnabled = false//不支持用户操作
        starView.delegate = self
//        starView.followDuration = 0.1//滑动或点击后跟随到达时间
        starView.userPanEnabled = true //滑动
        starView.currentStarCount = 1 //当前显示的评星数
        starView.integerStar = false // 完整星星
        self.view.addSubview(starView)
    }
    //MARK: - 协议代理
    func starRate(view starRateView: JNStarRateView, count: Float) {
        print(count)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

