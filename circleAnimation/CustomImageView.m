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
        
   
        [self sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1467793803108&di=04dc2bab0dcfb2559f161e270794d8e9&imgtype=jpg&src=http%3A%2F%2Fg.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2F5366d0160924ab18292aca2536fae6cd7b890be7.jpg"] placeholderImage:nil options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            
            self.progressIndicatorView.progress = (CGFloat)receivedSize/(CGFloat)expectedSize;
            
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            [self.progressIndicatorView reveal];
            
        }];
        
    }
    return self;
}



@end
