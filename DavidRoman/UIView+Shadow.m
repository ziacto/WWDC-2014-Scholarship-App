//
//  UIView+Shadow.m
//  DavidRoman
//
//  Created by David Román Aguirre on 05/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import "UIView+Shadow.h"

@implementation UIView (Shadow)

- (void)setShadowWithColor:(UIColor *)color offset:(CGSize)offset radius:(CGFloat)radius {
    [self.layer setShadowColor:color.CGColor];
    [self.layer setShadowOffset:offset];
    [self.layer setShadowOpacity:1];
    [self.layer setShadowRadius:radius];
}

@end
