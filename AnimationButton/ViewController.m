//
//  ViewController.m
//  AnimationButton
//
//  Created by oujinlong on 16/6/15.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "ViewController.h"
#import "OJLAnimationButton.h"
#import "SecondViewController.h"
#import "OJLNavigationController.h"
@interface ViewController () <OJLAnimationButtonDelegate>
@property (nonatomic, weak) OJLAnimationButton* button1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBarHidden = YES;
    
    self.view.backgroundColor = [UIColor colorWithRed:18/255.0 green:200/255.0 blue:252/255.0 alpha:1];
    
    OJLAnimationButton* button1 = [OJLAnimationButton buttonWithFrame:CGRectMake(30, 300, self.view.bounds.size.width - 2 * 30, 50)];
    self.button1 = button1;
    button1.delegate = self;
    [button1 setTitle:@"Login" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:button1];
    
    [button1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    
    OJLAnimationButton* button2 = [OJLAnimationButton buttonWithFrame:CGRectMake(80, 100, self.view.bounds.size.width - 2 * 80, 50)];
    button2.delegate = self;
    [button2 setTitle:@"OK" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:button2];
    
    [button2 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)click:(OJLAnimationButton*)button{

    [button startAnimation];
    
}

#pragma mark OJLAnimationButtonDelegate
-(void)OJLAnimationButtonDidStartAnimation:(OJLAnimationButton *)OJLAnimationButton{
    NSLog(@"start");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [OJLAnimationButton stopAnimation];
    });
}

-(void)OJLAnimationButtonDidFinishAnimation:(OJLAnimationButton *)OJLAnimationButton{
    NSLog(@"stop");
}

-(void)OJLAnimationButtonWillFinishAnimation:(OJLAnimationButton *)OJLAnimationButton{
    if (OJLAnimationButton == self.button1) {
        
        SecondViewController* vc = [[SecondViewController alloc] init];
        [((OJLNavigationController*)self.navigationController) pushViewController:vc withCenterButton:OJLAnimationButton];
    }
}
@end
