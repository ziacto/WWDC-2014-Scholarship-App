//
//  UIView+Shadow.h
//  DavidRoman
//
//  Created by David Román Aguirre on 05/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Shadow)

- (void)setShadowWithColor:(UIColor *)color offset:(CGSize)offset radius:(CGFloat)radius;

@end
