//
//  circularLoaderView.h
//  circleAnimation
//
//  Created by comsubin on 16/7/5.
//  Copyright © 2016年 comsubin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface circularLoaderView : UIView


@property(nonatomic,strong)CAShapeLayer *circlePathLayer;

@property(nonatomic,assign) CGFloat circleRadius;



@property(nonatomic,assign)CGFloat progress;

-(void)reveal;



@end
