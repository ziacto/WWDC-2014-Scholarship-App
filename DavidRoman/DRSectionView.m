//
//  DRSectionView.m
//  DavidRoman
//
//  Created by David Román Aguirre on 09/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import "DRSectionView.h"

#import "Masonry.h"

@implementation DRSectionView

- (id)init {
    if (self = [super init]) {
        [self setup];
        [self setupSubviews];
        [self setupConstraints];
    }
    
    return self;
}

- (void)setup {
    self.navigationBar = [DRSectionViewNavigationBar new];
    self.scrollView = [DRSectionViewScrollView new];
}

- (void)setupSubviews {
    [self.navigationBar setDelegate:self];
    [self addSubview:self.navigationBar];
    
    [self insertSubview:self.scrollView belowSubview:self.navigationBar];
}

- (void)setupConstraints {
    [self.navigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.left.equalTo(@0);
        make.right.equalTo(@0);
    }];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.bottom.equalTo(@0);
    }];
}

- (void)showScrollViewAnimatedly:(BOOL)animatedly {
    [self.scrollView.topConstraint uninstall];
    
    [self.scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
        self.scrollView.topConstraint = make.top.equalTo(self.navigationBar.mas_bottom);
    }];
    
    [UIView animateWithDuration:(animatedly ? 0.6 : 0) delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self layoutIfNeeded];
    } completion:nil];
}

- (void)hideScrollViewAnimatedly:(BOOL)animatedly {
    [self.scrollView.topConstraint uninstall];
    
    [self.scrollView mas_updateConstraints:^(MASConstraintMaker *make) {
        self.scrollView.topConstraint = make.top.equalTo(self.mas_bottom);
    }];
    
    [UIView animateWithDuration:(animatedly ? 0.3 : 0) animations:^{
        [self layoutIfNeeded];
    }];
}

- (UIBarPosition)positionForBar:(id<UIBarPositioning>)bar {
    return UIBarPositionTopAttached;
}

@end
