//
//  DrawView.m
//  DoodleView
//
//  Created by Lanou on 14-1-21.
//  Copyright (c) 2014年 Lanou. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        UILabel * mylable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
//        [mylable setBackgroundColor:[UIColor blueColor]];
//        [self addSubview:mylable];
//        [mylable release];
        
       // _points = [[NSMutableArray alloc] init];
        _allLines = [[NSMutableArray alloc]init];
        
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"+++");
    
    UITouch * mytouch = [touches anyObject];//获得点击事件
    CGPoint point = [mytouch locationInView:self];//结构体，获得坐标
    NSValue * first = [NSValue valueWithCGPoint:point];//nsvalue把结构体转换成对象
    
    NSMutableArray * points = [NSMutableArray array];
    [_allLines addObject:points];
    [points addObject:first];
    
    //[_points addObject:first];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"___");
    
    UITouch * mytouch = [touches anyObject];
    CGPoint  point = [mytouch locationInView:self];
    NSValue * move = [NSValue valueWithCGPoint:point];
//    [_points addObject:move];
//    NSLog(@"points = %@",_points);
    NSMutableArray * last = [_allLines lastObject];
    [last addObject:move];
    
    
    
    [self setNeedsDisplay];//系统级别的调用drawrect
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"***");
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"////");
    
    
   // _points = [[NSMutableArray alloc] init];
}

//-(void)dealloc
//{
//    [_points release];
//    [super dealloc];
//}


-(void)dealloc
{
    [_allLines release];
    [super dealloc];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    //多条线绘制
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (NSMutableArray * points in _allLines) {
        NSValue * first = [points objectAtIndex:0];
        CGPoint firstpoint = [first CGPointValue];
        CGContextMoveToPoint(context, firstpoint.x, firstpoint.y);
      //  CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
        
        for (NSValue * value in points) {
            CGPoint last = [value CGPointValue];
            CGContextAddLineToPoint(context, last.x, last.y);
        }
        CGContextStrokePath(context);

    }
    
    
    
    
    
    
    
    
    //单条线
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    if (_points.count == 0) {
//        return;
//    }
//    
//    NSValue * first = [_points objectAtIndex:0];
//    CGPoint firstpoint = [first CGPointValue];
//    
//    NSValue * last = [_points lastObject];
//    CGPoint lastpoint = [last CGPointValue];
//    CGContextMoveToPoint(context, firstpoint.x,firstpoint.y);
//    CGContextSetLineWidth(context, 6);
//    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
//    for (NSValue * value in _points) {
//        CGPoint nowpoint = [value CGPointValue];
//        CGContextAddLineToPoint(context, nowpoint.x, nowpoint.y);
//    }
//    
//    CGContextStrokePath(context);
}


@end
