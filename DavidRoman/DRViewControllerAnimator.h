//
//  DRViewControllerAnimator.h
//  DavidRoman
//
//  Created by David Román Aguirre on 11/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DRViewControllerAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic) NSTimeInterval presentationDuration;
@property (nonatomic) NSTimeInterval dismissalDuration;

@property (nonatomic, getter = isPresenting) BOOL presenting;

- (void)animatePresentationFromViewControllerView:(UIView *)fromView toViewControllerView:(UIView *)toView animationCompletion:(void (^)(BOOL completed))completion;
- (void)animateDismissalFromViewControllerView:(UIView *)fromView toViewControllerView:(UIView *)toView animationCompletion:(void (^)(BOOL completed))completion;

@end
