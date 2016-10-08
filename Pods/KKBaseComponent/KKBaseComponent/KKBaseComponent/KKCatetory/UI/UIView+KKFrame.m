//
//  UIView+Frame.m
//  Frame
//
//  Created by MR.KING on 15/12/15.
//  Copyright © 2015年 MR.KING. All righUI reserved.
//

#import "UIView+KKFrame.h"


@implementation UIView (KKFrame)

@dynamic kk_right;


- (void)setKk_x:(CGFloat)kk_x
{
    CGRect frame = self.frame;
    frame.origin.x = kk_x;
    self.frame = frame;
}

- (void)setKk_y:(CGFloat)kk_y
{
    CGRect frame = self.frame;
    frame.origin.y = kk_y;
    self.frame = frame;
}

- (CGFloat)kk_x
{
    return self.frame.origin.x;
}

- (CGFloat)kk_y
{
    return self.frame.origin.y;
}

- (void)setKk_centerX:(CGFloat)kk_centerX
{
    CGPoint center = self.center;
    center.x = kk_centerX;
    self.center = center;
}

- (CGFloat)kk_centerX
{
    return self.center.x;
}

- (void)setKk_centerY:(CGFloat)kk_centerY
{
    CGPoint center = self.center;
    center.y = kk_centerY;
    self.center = center;
}

- (CGFloat)kk_centerY
{
    return self.center.y;
}

- (void)setKk_width:(CGFloat)kk_width
{
    CGRect frame = self.frame;
    frame.size.width = kk_width;
    self.frame = frame;
}

- (void)setKk_height:(CGFloat)kk_height
{
    CGRect frame = self.frame;
    frame.size.height = kk_height;
    self.frame = frame;
}

- (CGFloat)kk_height
{
    return self.frame.size.height;
}

- (CGFloat)kk_width
{
    return self.frame.size.width;
}

- (void)setKk_size:(CGSize)kk_size
{
    CGRect frame = self.frame;
    frame.size = kk_size;
    self.frame = frame;
}

- (CGSize)kk_size
{
    return self.frame.size;
}

- (void)setKk_origin:(CGPoint)kk_origin
{
    CGRect frame = self.frame;
    frame.origin = kk_origin;
    self.frame = frame;
}

- (CGPoint)kk_origin
{
    return self.frame.origin;
}

-(void)setKk_left:(CGFloat)kk_left{
    self.kk_x = kk_left;
}

-(CGFloat)kk_left{
    return self.frame.origin.x;
}


-(CGFloat)kk_right{
    return CGRectGetMaxX(self.frame);
}

-(void)setKk_top:(CGFloat)kk_top{
    self.kk_y = kk_top;
}

-(CGFloat)kk_top{
    return self.frame.origin.y;
}

-(CGFloat)kk_bottom{
    return CGRectGetMaxY(self.frame);
}

@end
