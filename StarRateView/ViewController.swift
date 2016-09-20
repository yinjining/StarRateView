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
//        let starView = JNStarRateView.init(frame: CGRect(x: 20,y: 60,width: 300,height: 50))//默认的是5颗星，分数为0分
        let starView = JNStarRateView.init(frame: CGRect(x: 20,y: 60,width: 300,height: 50), starCount: 6, score: 3.4)
//        starView.userInteractionEnabled = false//不支持用户操作
        starView.delegate = self
//        starView.usePanAnimation = true
        starView.allowUserPan = true//滑动评星
//        starView.allowUnderCompleteStar = false // 完整星星
        self.view.addSubview(starView)
    }
    //MARK: - 协议代理
    func starRate(view starRateView: JNStarRateView, score: Float) {
        print(score)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

