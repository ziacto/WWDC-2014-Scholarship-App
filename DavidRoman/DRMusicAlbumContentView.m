//
//  DRMusicAlbumContentView.m
//  DavidRoman
//
//  Created by David Román Aguirre on 09/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import "DRMusicAlbumContentView.h"

#import "UIView+Shadow.h"
#import "UIView+MotionEffects.h"

#import "Masonry.h"

@interface DRMusicAlbumContentView ()

@property (strong, nonatomic) UIView *darkBackground;
@property (strong, nonatomic) UIButton *playButton;

@end

@implementation DRMusicAlbumContentView

- (id)init {
    if (self = [super init]) {
        [self setupSubviews];
        [self setupConstraints];
    }
    
    return self;
}

- (void)setup {
    [super setup];
    
    [self setUserInteractionEnabled:YES];
    
    self.darkBackground = [UIView new];
}

- (void)setupSubviews {
    [self.darkBackground setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.5]];
    [self addSubview:self.darkBackground];
    
    self.playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.playButton setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    [self.playButton setShadowWithColor:[UIColor colorWithWhite:0 alpha:0.3] offset:CGSizeMake(0, 1) radius:0];
    [self.playButton addMotionEffectsWithRatio:15];
    [self.playButton addTarget:self action:@selector(getAlbum:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:self.playButton];
}

- (void)getAlbum:(UIButton *)button {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.albumURL]];
}

- (void)setupConstraints {
    [self.darkBackground mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    
    [self.playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.playButton.superview);
        make.size.equalTo(self.mas_width).dividedBy(4);
    }];
}

+ (instancetype)contentViewWithAlbumImage:(UIImage *)image albumURL:(NSString *)url {
    id contentView = [super contentViewWithImage:image];
    
    [contentView setAlbumURL:url];
    
    return contentView;
}

@end
