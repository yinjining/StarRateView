#JNStarRateView是封装好的一个星星评分控件

![星星.png](http://upload-images.jianshu.io/upload_images/2953881-890745e4832cbcf6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

注：项目只支持>swift3.0
##使用如下：
###1、创建
//let starView = JNStarRateView.init(frame: CGRect(x: 20,y: 60,width: 300,height: 50))//默认的是5颗星，分数为0分

let starView = JNStarRateView.init(frame: CGRect(x: 20,y: 60,width: 300,height: 50), starCount: 6, score: 3.0)

self.view.addSubview(starView)

###2、关闭用户操作,默认是开启的（用户可以操作评分）
starView.userInteractionEnabled = false//不支持用户操作

###3、支持滑动评分，默认是点击评分
starView.allowUserPan = true//滑动评星

###4、只支持完整星星评分，默认是一分等于一颗星，允许0.1颗星
starView.allowUnderCompleteStar = false // 完整星星

###5、支持动画，默认是不支持
starView.usePanAnimation = true

###6、通过协议代理返回评分后的分数,别忘记了准守协议哦
starView.delegate = self
func starRate(view starRateView: JNStarRateView, score: Float) {
        print(score)
    }

更详细的讲解请看[http://www.jianshu.com/p/ea88987a7e87](http://www.jianshu.com/p/ea88987a7e87)
