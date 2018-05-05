# XZAlertView
一个支持自定义的图文弹窗<br>
支持图片、标题、副标题、内容、按钮自定义搭配<br><br>
<a href="#usage">使用方法</a><br>
<h2>效果图：</h2><br>
<img src = "https://github.com/mrkizy/XZAlertView/blob/master/result5.png" />     
<img src = "https://github.com/mrkizy/XZAlertView/blob/master/result6.png" /><br>
<img src = "https://github.com/mrkizy/XZAlertView/blob/master/result1.png" />     
<img src = "https://github.com/mrkizy/XZAlertView/blob/master/result2.png" /><br>
<img src = "https://github.com/mrkizy/XZAlertView/blob/master/result3.png" />     
<img src = "https://github.com/mrkizy/XZAlertView/blob/master/result4.png" /><br>
<h2 name="usage">如何使用XZAlertView</h2>
/**
 *  @decription 构造方法
 *  @param  title 标题，可nil
 *  @param  subTitle 副标题，可nil
 *  @param  imgUrlStr  图片，支持本地和网络图片
 *  @param  cancelStr  按钮1，可nil
 *  @param  commitStr  按钮2，可nil
 *  @param  block  按钮点击回调
 *  @warning    利用构造方法初始化，需要调用-(void)show才能显示
 */

- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content cancel:(NSString *)cancelStr commit:(NSString *)commitStr block:(MKIntegerBlock)block;
- (instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle content:(NSString *)content imgUrlStr:(NSString *)imgUrlStr cancel:(NSString *)cancelStr commit:(NSString *)commitStr block:(MKIntegerBlock)block;

/**
 *  @decription 工厂方法
 *  @param  title 标题，可nil
 *  @param  subTitle 副标题，可nil
 *  @param  imgUrlStr  图片，支持本地和网络图片
 *  @param  cancelStr  按钮1，可nil
 *  @param  commitStr  按钮2，可nil
 *  @param  block  按钮点击回调
 */
+ (void)showTitle:(NSString *)title subTitle:(NSString *)subTitle content:(NSString *)content imgView:(NSString *)imgUrl cancel:(NSString *)cancelStr commit:(NSString *)commitStr block:(MKIntegerBlock)block;

+ (void)showTitle:(NSString *)title content:(NSString *)content cancel:(NSString *)cancelStr commit:(NSString *)commitStr block:(MKIntegerBlock)block;
<h2>属性</h2>
/**
 *  @decription 动画类型 值为：<br>
        showAnimationType_default,  //默认动画（无）<br>
        showAnimationType_moveIn,   //移入<br>
        showAnimationType_Push,    //push方式<br>
        showAnimationType_Fade, //淡入淡出<br>
        showAnimationType_Reveal,   //渐入
 */
@property (nonatomic, assign) showAnimationType animationType;

/**
 *  @decription 动画方向 值为：<br>kCATransitionFromRight<br>kCATransitionFromLeft<br>kCATransitionFromTop<br>kCATransitionFromBottom<br>
 *  @warning    需要结合animationType使用，个别动画效果不支持subType
 */
@property (nonatomic, copy) NSString *subType;
