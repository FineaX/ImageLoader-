//
//  circularLoaderView.m
//  circleAnimation
//
//  Created by comsubin on 16/7/5.
//  Copyright © 2016年 comsubin. All rights reserved.
//

#import "circularLoaderView.h"

@implementation circularLoaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        [self configure];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self configure];
    }
    return self;
}

-(void)configure{
    
    self.circleRadius = 20.0;
    
  
    self.circlePathLayer = [CAShapeLayer new];
    
    self.circlePathLayer.frame = self.bounds;
    
    self.circlePathLayer.lineWidth = 2;
    
    self.circlePathLayer.fillColor = [UIColor clearColor].CGColor;
    
    self.circlePathLayer.strokeColor = [UIColor redColor].CGColor;
    
    [self.layer addSublayer:self.circlePathLayer];
    
    self.backgroundColor = [UIColor whiteColor];
    
    self.progress = 0;
}

-(CGRect)circleFrame{
    
    CGRect circleFrame = CGRectMake(0, 0, 2*self.circleRadius,2*self.circleRadius);
    
    circleFrame.origin.x = CGRectGetMidX(self.circlePathLayer.bounds)-CGRectGetMidX(circleFrame);
    circleFrame.origin.y = CGRectGetMidY(self.circlePathLayer.bounds)-CGRectGetMidY(circleFrame);
    
    NSLog(@"----------%@",NSStringFromCGRect(circleFrame));
    return circleFrame;
}

-(UIBezierPath *)circlePath{
    
    //内切圆
    return [UIBezierPath bezierPathWithOvalInRect:[self circleFrame]];
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.circlePathLayer.frame = self.bounds;
    
    self.circlePathLayer.path = [self circlePath].CGPath;
    
}


-(void)setProgress:(CGFloat)progress{
    
    if (progress>1) {
        
        self.circlePathLayer.strokeEnd = 1;
        
    }else if (progress<0){
        
        self.circlePathLayer.strokeEnd = 0;
        
    }else{
        
        self.circlePathLayer.strokeEnd = progress;
    }
    
        
}


-(CGFloat)progress{
    
    
    return self.circlePathLayer.strokeEnd;
    
    
}


-(void)reveal{
    
    self.backgroundColor = [UIColor clearColor];
    
    self.progress = 1;
    
    [self.circlePathLayer removeAnimationForKey:@"strokeEnd"];
    
    [self.circlePathLayer removeFromSuperlayer];
    
    self.superview.layer.mask = self.circlePathLayer;
    
    
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    CGFloat finalRadius = sqrt((center.x*center.x)+(center.y*center.y));
    
    CGFloat radiusInset = finalRadius - self.circleRadius;
    
    
    CGRect outerRect = CGRectInset([self circleFrame], -radiusInset, -radiusInset);
    
    CGPathRef toPath = [UIBezierPath bezierPathWithOvalInRect:outerRect].CGPath;
    
    CGPathRef fromPath = self.circlePathLayer.path;
    
    CGFloat fromLineWidth = self.circlePathLayer.lineWidth;
    
    
    
    [CATransaction begin];
    
    
    [CATransaction setValue:(__bridge id _Nullable)kCFBooleanTrue forKey:kCATransactionDisableActions];
    
    self.circlePathLayer.lineWidth = 2*finalRadius;
    
    self.circlePathLayer.path = toPath;
    
    [CATransaction commit];
    
    CABasicAnimation *lineWidthAnimation = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
    
    lineWidthAnimation.fromValue = [NSNumber numberWithFloat:fromLineWidth];
    
    lineWidthAnimation.toValue = [NSNumber numberWithFloat:2*finalRadius];
    
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    
    pathAnimation.fromValue = (__bridge id _Nullable)(fromPath);

    pathAnimation.toValue = (__bridge id _Nullable)(toPath);
    
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup new];
    groupAnimation.duration = 1;
    groupAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    groupAnimation.animations = @[pathAnimation,lineWidthAnimation];
    
    groupAnimation.delegate = self;
    
    [self.circlePathLayer addAnimation:groupAnimation forKey:@"strokeWidth"];
    
    
}


-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    
    self.superview.layer.mask = nil;
}




@end
