//
//  LineView.m
//  基本图形绘制
//
//  Created by MAC on 2017/6/19.
//  Copyright © 2017年 GuoDongge. All rights reserved.
//

#import "LineView.h"

@implementation LineView



/**
 绘图
步骤：
 1、获取上下文
 2、创建路径
 3、把路径添加到上下文
 4、渲染上下文
 
 // 为什么要再drawRect里面绘图，只有在这个方法里面才能获取到跟View的layer相关联的图形上下文
 // 什么时候调用:当这个View要显示的时候才会调用drawRect绘制图形
 @param rect 当前控件的bounds
 */
- (void)drawRect:(CGRect)rect {
   
    
    [self drawLine];
    
    [self drawLine1];
    
    [self drawLine2];
    
    
    
}

#pragma mark - 最原始的绘图方式

-(void)drawLine
{
    //1、获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //2、描述路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    //设置起点
    CGPathMoveToPoint(path, NULL, 50, 50);
    
    //添加一根线到某个点
    CGPathAddLineToPoint(path, NULL, 200, 200);
    
    //3、把路径添加到上下文
    CGContextAddPath(ctx, path);
    
    //4、渲染上下文
    CGContextStrokePath(ctx);
    
    
    
}

#pragma mark - 绘图第二种方式

-(void)drawLine1
{
    //获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //描述路径
    //设置起点
    CGContextMoveToPoint(ctx, 0, 50);
    
    CGContextAddLineToPoint(ctx, 200, 50);
    
    //渲染上下文
    CGContextStrokePath(ctx);
}


#pragma mark - 绘图的第三种方式

-(void)drawLine2
{
    //UIKit已经封装了一些绘图的功能
    
    //贝瑟尔路径
    UIBezierPath * path = [UIBezierPath bezierPath];
    
    //设置起点
    
    [path moveToPoint:CGPointMake(50, 50)];
    
    //添加一根线到某个点
    [path addLineToPoint:CGPointMake(50, 200)];
    
    //绘制路径
    [path stroke];
    
    
    
}








@end
