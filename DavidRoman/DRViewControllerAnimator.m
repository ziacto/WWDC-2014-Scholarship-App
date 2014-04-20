//
//  DRViewControllerAnimator.m
//  DavidRoman
//
//  Created by David Román Aguirre on 11/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import "DRViewControllerAnimator.h"

@implementation DRViewControllerAnimator

- (id)init {
    if (self = [super init]) {
        [self setPresentationDuration:0.4];
        [self setDismissalDuration:0.4];
    }
    
    return self;
}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return self.isPresenting ? self.presentationDuration : self.dismissalDuration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    if (self.isPresenting) {
        [containerView insertSubview:toViewController.view aboveSubview:fromViewController.view];
        
        [self animatePresentationFromViewControllerView:fromViewController.view toViewControllerView:toViewController.view animationCompletion:^(BOOL completed) {
            [transitionContext completeTransition:YES];
        }];
    } else {
        [containerView insertSubview:toViewController.view belowSubview:fromViewController.view];
        
        [self animateDismissalFromViewControllerView:fromViewController.view toViewControllerView:toViewController.view animationCompletion:^(BOOL completed) {
            [fromViewController.view removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
    }
}

- (void)animatePresentationFromViewControllerView:(UIView *)fromView toViewControllerView:(UIView *)toView animationCompletion:(void (^)(BOOL completed))completion {
    [toView setFrame:CGRectMake(0, fromView.frame.size.height, fromView.frame.size.width, fromView.frame.size.height)];
    
    [UIView animateWithDuration:self.presentationDuration animations:^{
        [toView setFrame:CGRectMake(0, 0, fromView.frame.size.width, fromView.frame.size.height)];
    } completion:completion];
}

- (void)animateDismissalFromViewControllerView:(UIView *)fromView toViewControllerView:(UIView *)toView animationCompletion:(void (^)(BOOL))completion {
    [UIView animateWithDuration:self.presentationDuration animations:^{
        [fromView setFrame:CGRectMake(0, toView.frame.size.height, toView.frame.size.width, toView.frame.size.height)];
    } completion:completion];
}

@end
