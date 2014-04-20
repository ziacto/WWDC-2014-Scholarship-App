//
//  DRImageContentView.m
//  DavidRoman
//
//  Created by David Román Aguirre on 09/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import "DRImageContentView.h"

#import "UIView+MotionEffects.h"

#import "Masonry.h"

@implementation DRImageContentView

- (id)init {
    if (self = [super init]) {
        [self setup];
    }
    
    return self;
}

- (void)setup {
    [self setContentMode:UIViewContentModeScaleAspectFill];
    [self setClipsToBounds:YES];
    [self.layer setCornerRadius:10];
    [self.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.layer setBorderWidth:1];
    [self addMotionEffectsWithRatio:15];
}

+ (instancetype)contentViewWithImage:(UIImage *)image {
    id contentView = [self new];
    
    [contentView setImage:image];
    
    return contentView;
}

- (void)didMoveToSuperview {
    if (!self.superview) return;
    
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.superview);
        make.left.greaterThanOrEqualTo(@20);
        make.right.lessThanOrEqualTo(@-20);
        make.height.lessThanOrEqualTo(self.mas_width).multipliedBy(self.image.size.height/self.image.size.width);
        
        if ([UIScreen mainScreen].bounds.size.width <= 400) {
            make.width.lessThanOrEqualTo(@250);
        } else {
            make.width.lessThanOrEqualTo(self.superview.mas_width).dividedBy(2.25);
        }
    }];
}

@end
