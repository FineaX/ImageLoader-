//
//  CustomImageView.m
//  circleAnimation
//
//  Created by comsubin on 16/7/5.
//  Copyright © 2016年 comsubin. All rights reserved.
//

#import "CustomImageView.h"
#import "UIImageView+WebCache.h"
@implementation CustomImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.progressIndicatorView = [[circularLoaderView alloc]initWithFrame:CGRectZero];
        
        [self addSubview:self.progressIndicatorView];
        
        self.progressIndicatorView.frame = self.bounds;
        
        self.progressIndicatorView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        
   
        [self sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1467797356348&di=99a577b60f40c0a957d46ae455d85c7e&imgtype=jpg&src=http%3A%2F%2Fpic13.nipic.com%2F20110310%2F6400731_100538610118_2.jpg"] placeholderImage:nil options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            
            self.progressIndicatorView.progress = (CGFloat)receivedSize/(CGFloat)expectedSize;
            
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            [self.progressIndicatorView reveal];
            
        }];
        
    }
    return self;
}



@end
