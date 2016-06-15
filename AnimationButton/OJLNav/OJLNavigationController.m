//
//  OJLNavigationController.m
//  AnimationButton
//
//  Created by oujinlong on 16/6/15.
//  Copyright © 2016年 oujinlong. All rights reserved.
//

#import "OJLNavigationController.h"
#import "OJLNavAnimation.h"
@interface OJLNavigationController () <UINavigationControllerDelegate>
@property (nonatomic, strong) UIButton* centerButton;
@end

@implementation OJLNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
-(void)pushViewController:(UIViewController *)viewController withCenterButton:(UIButton *)button{
    self.centerButton = button;
    self.delegate = self;
    
    [super pushViewController:viewController animated:YES];
}
#pragma mark UINavigationControllerDelegate
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    OJLNavAnimation* animation = [OJLNavAnimation new];
    animation.centerButton = self.centerButton;
    return animation;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
