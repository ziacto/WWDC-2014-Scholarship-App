//
//  DRBlurryWindow.m
//  DavidRoman
//
//  Created by David Román Aguirre on 11/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import "DRBlurryWindow.h"

#import "Masonry.h"

#define DEGREES_TO_RADIANS(degrees) (degrees * M_PI / 180)

@implementation DRBlurryWindow

- (id)init {
    if (self = [super init]) {
        [self setup];
        [self setupSubviews];
        [self setupConstraints];
    }
    
    return self;
}

- (void)setup {
    [self setFrame:[[UIScreen mainScreen] bounds]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(statusBarOrientationOrFrameChanged:) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(statusBarOrientationOrFrameChanged:) name:UIApplicationDidChangeStatusBarFrameNotification object:nil];
}

- (void)statusBarOrientationOrFrameChanged:(NSNotification *)notification {
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    [self.backgroundImageView setTransform:[self transformForOrientation:orientation]];
}

- (CGAffineTransform)transformForOrientation:(UIInterfaceOrientation)orientation {
    switch (orientation) {
        case UIInterfaceOrientationPortrait:
            return CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(0));
            
        case UIInterfaceOrientationPortraitUpsideDown:
            return CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(180));
            
        case UIInterfaceOrientationLandscapeLeft:
            return CGAffineTransformMakeRotation(-DEGREES_TO_RADIANS(90));
            
        case UIInterfaceOrientationLandscapeRight:
            return CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(90));
    }
}

- (void)setupSubviews {
    self.backgroundImageView = [DRBlurryImageView new];
    
    UIViewController *controller = [UIViewController new];
    [controller setView:self.backgroundImageView];
    
    [self addSubview:controller.view];
}

- (void)setupConstraints {
    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
}

@end
