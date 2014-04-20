//
//  DRSectionViewScrollView.h
//  DavidRoman
//
//  Created by David Román Aguirre on 09/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MASConstraint;

@interface DRSectionViewScrollView : UIScrollView

@property (strong, nonatomic) MASConstraint *topConstraint;
@property (strong, nonatomic) UIView *contentView;

- (void)addSubviews:(NSArray *)subviews;

@end
