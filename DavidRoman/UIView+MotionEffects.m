//
//  UIView+MotionEffects.m
//  DavidRoman
//
//  Created by David Román Aguirre on 03/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import "UIView+MotionEffects.h"

@implementation UIView (MotionEffects)

- (void)addMotionEffectsWithRatio:(CGFloat)ratio {
    UIInterpolatingMotionEffect *xMotion = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    
    [xMotion setMinimumRelativeValue:@(-ratio)];
    [xMotion setMaximumRelativeValue:@(ratio)];
    
    UIInterpolatingMotionEffect *yMotion = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    
    [yMotion setMinimumRelativeValue:@(-ratio)];
    [yMotion setMaximumRelativeValue:@(ratio)];
    
    UIMotionEffectGroup *group = [UIMotionEffectGroup new];
    [group setMotionEffects:@[xMotion, yMotion]];
    
    [self addMotionEffect:group];
}

@end
