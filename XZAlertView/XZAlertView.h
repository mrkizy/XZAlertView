//
//  GuideMaskView.h
//  JKHire
//
//  Created by yanqb on 2017/3/3.
//  Copyright © 2017年 xianshijian. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GuideMaskAlertView;

@protocol GuideMaskAlertViewDelegate <NSObject>

- (void)guideMaskAlertView:(GuideMaskAlertView *)alertView actionIndex:(NSInteger)actionIndex;

@end

typedef NS_ENUM(NSInteger, showAnimationType) {
    showAnimationType_default,  //默认动画（无）
    showAnimationType_moveIn,   //移入
    showAnimationType_Push,    //push方式
    showAnimationType_Fade, //淡入淡出
    showAnimationType_Reveal,   //渐入
};

typedef void (^MKIntegerBlock)(NSInteger result);

@interface XZAlertView : UIView

@property (nonatomic, assign) showAnimationType animationType;

/**
 *  @decription 动画方向 值为：kCATransitionFromRight、kCATransitionFromLeft、kCATransitionFromTop、kCATransitionFromBottom
 *  @warning    需要结合animationType使用，个别动画效果不支持subType
 */
@property (nonatomic, copy) NSString *subType;
@property (nonatomic, weak) GuideMaskAlertView *alertView;

- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content cancel:(NSString *)cancelStr commit:(NSString *)commitStr block:(MKIntegerBlock)block;
- (instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle content:(NSString *)content imgUrlStr:(NSString *)imgUrlStr cancel:(NSString *)cancelStr commit:(NSString *)commitStr block:(MKIntegerBlock)block;

+ (void)showTitle:(NSString *)title subTitle:(NSString *)subTitle content:(NSString *)content imgView:(NSString *)imgUrl cancel:(NSString *)cancelStr commit:(NSString *)commitStr block:(MKIntegerBlock)block;

+ (void)showTitle:(NSString *)title content:(NSString *)content cancel:(NSString *)cancelStr commit:(NSString *)commitStr block:(MKIntegerBlock)block;

- (void)show;

@end



@interface GuideMaskAlertView : UIView

@property (nonatomic, weak) id<GuideMaskAlertViewDelegate> delegate;

@property (nonatomic, strong, readonly) UILabel *titleLab;
@property (nonatomic, strong, readonly) UILabel *labcontent;
@property (nonatomic, strong) UIImageView *imgView;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *commitStr;
@property (nonatomic, copy) NSString *cancelStr;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, copy) NSString *imgUrlStr;

@end

