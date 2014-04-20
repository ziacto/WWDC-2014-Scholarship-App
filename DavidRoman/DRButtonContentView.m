//
//  DRButtonContentView.m
//  DavidRoman
//
//  Created by David Román Aguirre on 14/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import "DRButtonContentView.h"

#import "UIView+MotionEffects.h"
#import "UIImage+ImageWithColor.h"

#import "Masonry.h"

@implementation DRButtonContentView

+ (instancetype)contentViewWithTitle:(NSString *)title url:(NSString *)url {
    DRButtonContentView *button = [super buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:18]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:button action:@selector(didTapButton:) forControlEvents:UIControlEventTouchUpInside];
    [button setButtonURL:url];
    [button.layer setCornerRadius:3];
    [button.layer setBorderColor:[UIColor whiteColor].CGColor];
    [button.layer setBorderWidth:1];
    [button setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor colorWithWhite:0.2 alpha:1] forState:UIControlStateHighlighted];
    [button setClipsToBounds:YES];
    [button addMotionEffectsWithRatio:15];
    
    return button;
}

- (void)didTapButton:(UIButton *)button {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.buttonURL]];
}

- (void)didMoveToSuperview {
    if (!self.superview) return;
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.superview);
        make.width.equalTo(@(self.intrinsicContentSize.width+20));
        make.height.equalTo(@(self.intrinsicContentSize.height+5));
    }];
}

@end
