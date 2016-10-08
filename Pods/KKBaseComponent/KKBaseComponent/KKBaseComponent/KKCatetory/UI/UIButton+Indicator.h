//
//  UIButton+Indicator.h
//  KKBtnIndicator
//
//  Created by MR.KING on 16/5/15.
//  Copyright © 2016年 Tmp. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSInteger {
    UIButtonIndicatorAnimationTypeDefault,
    UIButtonIndicatorAnimationTypeRound,
} UIButtonIndicatorAnimationType;

typedef enum : NSInteger {
    UIButtonIndicatorPositionRight, // default
    UIButtonIndicatorPositionCenter,
    UIButtonIndicatorPositionLeft
} UIButtonIndicatorPosition;

@interface UIButton (Indicator)

/// 可用 default round, 默认是系统的indicator，
@property(nonatomic,assign)UIButtonIndicatorAnimationType  kk_animationType;

/// 可用 right,center,left
@property(nonatomic,assign)UIButtonIndicatorPosition kk_position;

// 相对于titleLable 右侧/左侧偏移量 默认 10
@property(nonatomic,assign)CGFloat kk_xOffset;

/// 默认 0
@property(nonatomic,assign)CGFloat kk_yOffset;

/// 默认1
@property(nonatomic,assign)CGFloat kk_zoomScale;

/// 是否是正在动画
@property(nonatomic,assign)BOOL kk_animating;

/// 当使用默认的动画类型。动画图为 UIActivityIndicatorView
@property(nonatomic,strong,readonly)UIActivityIndicatorView * indicatorView;

-(void)startIndicatorAnimation;

-(void)stopIndicatorAnimation;

-(void)startIndicatorAnimation:(void(^)())didBegin;

-(void)stopIndicatorAnimationCompletion:(void(^)())completion;

@end
