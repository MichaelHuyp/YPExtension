//
//  UIView+Extent.m
//  新浪微薄
//
//  Created by 郭瑞轩 on 15/5/15.
//  Copyright (c) 2015年 xxx. All rights reserved.
//

#import "UIView+Extent.h"

@implementation UIView (Extent)

-(CGFloat)centerX
{
    return self.center.x;
}
-(CGFloat)centerY{
    return self.center.y;
}
-(void)setCenterX:(CGFloat)centerX
{
    CGPoint center=self.center;
    center.x=centerX;
    self.center=center;
}
-(void)setCenterY:(CGFloat)centerY
{
    CGPoint center=self.center;
    center.y=centerY;
    self.center=center;
}
-(CGFloat)x
{
    return self.frame.origin.x;
}
-(void)setX:(CGFloat)x
{
    CGRect frame=self.frame;
    frame.origin.x=x;
    self.frame=frame;
}


-(CGFloat)y
{
    return self.frame.origin.y;
}
-(void)setY:(CGFloat)y
{
    CGRect frame=self.frame;
    frame.origin.y=y;
    self.frame=frame;
}


-(CGFloat)width
{
    return self.frame.size.width;
}
-(void)setWidth:(CGFloat)width
{
    CGRect frame=self.frame;
    frame.size.width=width;
    self.frame=frame;
}


-(CGFloat)height
{
    return self.frame.size.height;
}
-(void)setHeight:(CGFloat)height
{
    CGRect frame=self.frame;
    frame.size.height=height;
    self.frame=frame;
}

-(CGSize)size
{
    return self.frame.size;
}
-(void)setSize:(CGSize)size
{    CGRect frame=self.frame;
    frame.size=size;
    self.frame=frame;

}

-(CGPoint)origin
{
    return self.frame.origin;
}
-(void)setOrigin:(CGPoint)origin
{    CGRect frame=self.frame;
    frame.origin=origin;
    self.frame=frame;
    
}
@end
