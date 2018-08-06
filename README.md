JNStarRateView是封装好的一个星星评分控件

项目中用到好多星星评分，整理了一下给大家分享下
![WechatIMG6.jpeg](https://upload-images.jianshu.io/upload_images/2953881-b22a62167874c8bf.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


我封装了一个类，以适应星星评分的各种情况。下面直接上代码

1、调用类使用

1.1 创建
```
//        let starView = JNStarRateView.init(frame: CGRect(x: 20,y: 60,width: 200,height: 38))//默认的是5颗星，分数为0分
let starView = JNStarRateView.init(frame: CGRect(x: 20,y: 60,width: 200,height: 38), numberOfStars: 5, currentStarCount: 3.4)
self.view.addSubview(starView)
```
1.2关闭用户操作,默认是开启的
```
starView.isUserInteractionEnabled = false//不支持用户操作
```
1.3支持滑动评分，默认只支持点击评分，不支持滑动评分
```
starView.userPanEnabled = true //滑动
```
1.4支持0.1颗星评分，默认整颗星
```
starView.integerStar = false // 完整星星
```
1.5滑动或点击后运动到手指位置所需时间
```
starView.followDuration = 0.1//滑动或点击后跟随到达时间，默认0.1秒
```
1.6当控件复用时，可修改当前星星数
```
starView.currentStarCount = 1 //当前显示的评星数
```
2、通过协议代理返回评分后的分数,别忘记了准守协议哦
```
starView.delegate = self


func starRate(view starRateView: JNStarRateView, score: Float) {
     print(score)
}
```

更详细的讲解请看[http://www.jianshu.com/p/ea88987a7e87](http://www.jianshu.com/p/ea88987a7e87)
