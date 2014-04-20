//
//  DRAppContentView.m
//  DavidRoman
//
//  Created by David Román Aguirre on 09/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import "DRAppContentView.h"

#import "UIView+MotionEffects.h"
#import "UIImage+ImageWithColor.h"

#import "Masonry.h"

@implementation DRAppContentView

- (id)init {
    if (self = [super init]) {
        [self setup];
        [self setupSubviews];
        [self setupConstraints];
    }
    
    return self;
}

- (void)setup {
    [self setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.5]];
    [self.layer setCornerRadius:10];
    [self addMotionEffectsWithRatio:15];
    
    self.iconImageView = [UIImageView new];
    self.nameLabel = [UILabel new];
    self.descriptionTextView = [UITextView new];
    self.downloadButton = [UIButton buttonWithType:UIButtonTypeCustom];
}

- (void)setupSubviews {
    [self.iconImageView.layer setCornerRadius:13];
    [self.iconImageView setClipsToBounds:YES];
    [self addSubview:self.iconImageView];
    
    [self.nameLabel setTextColor:[UIColor colorWithWhite:0 alpha:1]];
    [self.nameLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:18]];
    [self addSubview:self.nameLabel];
    
    UIColor *blueColor = [UIColor colorWithRed:7/255.0 green:108/255.0 blue:186/255.0 alpha:1];
    
    [self.downloadButton setBackgroundImage:[UIImage imageWithColor:blueColor] forState:UIControlStateHighlighted];
    [self.downloadButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.downloadButton setTitleColor:blueColor forState:UIControlStateNormal];
    [self.downloadButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:17]];
    [self.downloadButton.layer setCornerRadius:3];
    [self.downloadButton.layer setBorderColor:blueColor.CGColor];
    [self.downloadButton.layer setBorderWidth:1];
    [self.downloadButton setClipsToBounds:YES];
    [self.downloadButton setTitle:@"View in App Store" forState:UIControlStateNormal];
    [self.downloadButton addTarget:self action:@selector(viewApp:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.downloadButton];
    
    [self.descriptionTextView setTextColor:[UIColor colorWithWhite:0.2 alpha:1]];
    [self.descriptionTextView setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:16]];
    [self.descriptionTextView setEditable:NO];
    [self.descriptionTextView setBackgroundColor:[UIColor clearColor]];
    [self.descriptionTextView setTextContainerInset:UIEdgeInsetsZero];
    [self addSubview:self.descriptionTextView];
}

- (void)viewApp:(UIButton *)downloadButton {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.downloadURL]];
}

- (void)setupConstraints {
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.top.equalTo(@20);
        make.size.equalTo(@67);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).offset(15);
        make.top.equalTo(self.iconImageView).offset(7);
    }];
    
    [self.downloadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel);
        make.bottom.equalTo(self.iconImageView).offset(-7);
        make.width.equalTo(@(self.downloadButton.intrinsicContentSize.width+12));
        make.height.equalTo(@(self.downloadButton.intrinsicContentSize.height-6));
    }];
    
    [self.descriptionTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImageView.mas_bottom).offset(15);
        make.left.equalTo(@15);
        make.right.equalTo(@-15);
        make.bottom.equalTo(@-20);
    }];
}

- (void)didMoveToSuperview {
    if (!self.superview) return;
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.superview);
        make.left.greaterThanOrEqualTo(@20);
        make.right.lessThanOrEqualTo(@-20);
        make.height.equalTo(@300);
        
        if ([UIScreen mainScreen].bounds.size.width <= 400) {
            make.width.equalTo(@280);
        } else {
            make.width.equalTo(self.superview.mas_width).dividedBy(2.25);
        }
    }];
}

+ (instancetype)contentViewWithAppIcon:(UIImage *)icon name:(NSString *)name description:(NSString *)description downloadURL:(NSString *)url {
    DRAppContentView *contentView = [self new];
    
    [contentView.iconImageView setImage:icon];
    [contentView.nameLabel setText:name];
    [contentView.descriptionTextView setText:description];
    [contentView setDownloadURL:url];
    
    return contentView;
}

@end
