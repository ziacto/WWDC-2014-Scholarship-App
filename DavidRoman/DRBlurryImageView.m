//
//  DRBlurryImageView.m
//  DavidRoman
//
//  Created by David Román Aguirre on 11/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import "DRBlurryImageView.h"

#import "UIImage+ImageEffects.h"

#import "Masonry.h"

@interface DRBlurryImageView ()

@property (strong, nonatomic) UIImageView *normalImageView;

@end

@implementation DRBlurryImageView

- (id)init {
    if (self = [super init]) {
        [self setup];
        [self setupSubviews];
        [self setupConstraints];
    }
    
    return self;
}

- (void)setup {
    [self setContentMode:UIViewContentModeScaleAspectFill];
    
    self.normalImageView = [UIImageView new];
}

- (void)setupSubviews {
    [self.normalImageView setContentMode:UIViewContentModeScaleAspectFill];
    [self.normalImageView setAlpha:0];
    
    [self addSubview:self.normalImageView];
}

- (void)setupConstraints {
    [self.normalImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
}

- (void)setImage:(UIImage *)image {
    [self.normalImageView setImage:image];
    
    [super setImage:[image applyBlurWithRadius:15 tintColor:[UIColor colorWithWhite:0 alpha:0.2] saturationDeltaFactor:1.8 maskImage:nil]];
}

- (void)setBlurPercentage:(CGFloat)percentage {
    [self.normalImageView setAlpha:1-percentage];
}

@end
