//
//  OJLAnimationButton.h
//  AnimationButton
//
//  Created by oujinlong on 16/6/15.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OJLAnimationButton;
@protocol OJLAnimationButtonDelegate <NSObject>

-(void)OJLAnimationButtonDidStartAnimation:(OJLAnimationButton*)OJLAnimationButton;

-(void)OJLAnimationButtonDidFinishAnimation:(OJLAnimationButton *)OJLAnimationButton;

-(void)OJLAnimationButtonWillFinishAnimation:(OJLAnimationButton *)OJLAnimationButton;

@end
@interface OJLAnimationButton : UIButton
+(instancetype)buttonWithFrame:(CGRect)frame;

-(void)setborderColor:(UIColor*)color;

-(void)setborderWidth:(CGFloat)width;

-(void)startAnimation;

-(void)stopAnimation;
@property (nonatomic, weak) id <OJLAnimationButtonDelegate> delegate;
@end
