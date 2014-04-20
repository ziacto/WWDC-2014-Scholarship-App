//
//  DRSectionViewControllerAnimator.m
//  DavidRoman
//
//  Created by David Román Aguirre on 11/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import "DRSectionViewControllerAnimator.h"

@implementation DRSectionViewControllerAnimator

- (void)animatePresentationFromViewControllerView:(UIView *)fromView toViewControllerView:(UIView *)toView animationCompletion:(void (^)(BOOL))completion {
    [toView setAlpha:0];
    
    [UIView animateKeyframesWithDuration:self.presentationDuration delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{
            [fromView setAlpha:0];
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.5 animations:^{
            [toView setAlpha:1];
        }];
        
    } completion:completion];
}

- (void)animateDismissalFromViewControllerView:(UIView *)fromView toViewControllerView:(UIView *)toView animationCompletion:(void (^)(BOOL))completion {
    [UIView animateKeyframesWithDuration:self.presentationDuration delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{
            [fromView setAlpha:0];
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.5 animations:^{
            [toView setAlpha:1];
        }];
        
    } completion:completion];
}

@end
