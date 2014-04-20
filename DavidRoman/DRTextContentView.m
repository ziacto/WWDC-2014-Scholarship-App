//
//  DRTextContentView.m
//  DavidRoman
//
//  Created by David Román Aguirre on 09/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import "DRTextContentView.h"

#import "Masonry.h"

@implementation DRTextContentView

- (id)init {
    if (self = [super init]) {
        [self setup];
    }
    
    return self;
}

- (void)setup {
    [self setTextColor:[UIColor whiteColor]];
    [self setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:17]];
    [self setNumberOfLines:0];
}

+ (instancetype)contentViewWithText:(NSString *)text {
    DRTextContentView *contentView = [DRTextContentView new];
    
    [contentView setText:text];
    
    return contentView;
}

- (void)didMoveToSuperview {
    if (!self.superview) return;
    
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.right.equalTo(@-20);
    }];
}

@end
