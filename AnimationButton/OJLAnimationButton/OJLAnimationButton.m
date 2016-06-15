//
//  OJLAnimationButton.m
//  AnimationButton
//
//  Created by oujinlong on 16/6/15.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "OJLAnimationButton.h"
#import "OJLCircleAnimationView.h"
static NSTimeInterval startDuration = 0.3;
static NSTimeInterval endDuration = 0.5;
@interface OJLAnimationButton ()
@property (nonatomic, strong) OJLCircleAnimationView* circleView;
@property (nonatomic, assign) CGRect origionRect;
@end
@implementation OJLAnimationButton
- (OJLCircleAnimationView *)circleView
{
    if (!_circleView) {
        _circleView = [OJLCircleAnimationView viewWithButton:self];
        [self addSubview:_circleView];
    }
    return _circleView;
}

+(instancetype)buttonWithFrame:(CGRect)frame{
    OJLAnimationButton* button = [OJLAnimationButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = frame;
    button.layer.cornerRadius = frame.size.height / 2;
    button.layer.masksToBounds = YES;
    button.clipsToBounds = NO;
    button.origionRect = button.frame;
    return button;
}


-(void)setborderColor:(UIColor *)color{
    self.layer.borderColor = color.CGColor;
    
}

-(void)setborderWidth:(CGFloat)width{
    self.layer.borderWidth = width;
}



-(void)startAnimation{
    CGPoint center = self.center;
    CGFloat width = self.layer.cornerRadius * 2;
    CGFloat height = self.frame.size.height;
    CGRect desFrame = CGRectMake(center.x - width / 2, center.y - height / 2, width, height);

    self.userInteractionEnabled = NO;
    
    if ([self.delegate respondsToSelector:@selector(OJLAnimationButtonDidStartAnimation:)]) {
        [self.delegate OJLAnimationButtonDidStartAnimation:self];
    }

    [UIView animateWithDuration:startDuration animations:^{
        self.titleLabel.alpha = .0f;
        self.frame = desFrame;
    } completion:^(BOOL finished) {
  
        [self.circleView startAnimation];
    }];
}

-(void)stopAnimation{
    self.userInteractionEnabled = YES;
    
    
        if ([self.delegate respondsToSelector:@selector(OJLAnimationButtonWillFinishAnimation:)]) {
            [self.delegate OJLAnimationButtonWillFinishAnimation:self];
        }
        
        [self.circleView removeFromSuperview];
        self.circleView = nil;
        [UIView animateWithDuration:endDuration animations:^{
            self.frame = self.origionRect;
            self.titleLabel.alpha = 1.0f;
        } completion:^(BOOL finished) {
            if ([self.delegate respondsToSelector:@selector(OJLAnimationButtonDidFinishAnimation:)]) {
                [self.delegate OJLAnimationButtonDidFinishAnimation:self];
            }
        }];
    
}
@end
