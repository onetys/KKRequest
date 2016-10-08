//
//  UIView+Frame.h
//  Frame
//
//  Created by MR.KING on 15/12/15.
//  Copyright © 2015年 MR.KING. All righUI reserved.
//

#import <UIKit/UIKit.h>


#ifndef UIView_KKFrame
#define UIView_KKFrame

@interface UIView (KKFrame)

@property (nonatomic, assign) CGFloat kk_x;

@property (nonatomic, assign) CGFloat kk_y;

@property (nonatomic, assign) CGFloat kk_left;

@property (nonatomic, assign, readonly) CGFloat kk_right;

@property (nonatomic, assign) CGFloat kk_top;

@property (nonatomic, assign, readonly) CGFloat kk_bottom;

@property (nonatomic, assign) CGFloat kk_centerX;

@property (nonatomic, assign) CGFloat kk_centerY;

@property (nonatomic, assign) CGFloat kk_width;

@property (nonatomic, assign) CGFloat kk_height;

@property (nonatomic, assign) CGSize  kk_size;

@property (nonatomic, assign) CGPoint kk_origin;

@end

#endif