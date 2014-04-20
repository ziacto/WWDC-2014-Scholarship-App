//
//  DRGitHubRepositoryContentView.m
//  DavidRoman
//
//  Created by David Román Aguirre on 14/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import "DRGitHubRepositoryContentView.h"

#import "UIView+MotionEffects.h"
#import "UIImage+ImageWithColor.h"

#import "Masonry.h"

@interface DRGitHubRepositoryContentView ()

@property (strong, nonatomic) UIImageView *starImageView;

@end

@implementation DRGitHubRepositoryContentView

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
    
    self.nameLabel = [UILabel new];
    self.starsLabel = [UILabel new];
    self.starImageView = [UIImageView new];
    self.descriptionTextView = [UITextView new];
    self.repositoryButton = [UIButton buttonWithType:UIButtonTypeCustom];
}

- (void)setupSubviews {
    [self.nameLabel setTextColor:[UIColor colorWithWhite:0 alpha:1]];
    [self.nameLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:17]];
    [self addSubview:self.nameLabel];
    
    [self.starImageView setImage:[UIImage imageNamed:@"star"]];
    [self addSubview:self.starImageView];
    
    [self.starsLabel setTextColor:[UIColor colorWithRed:33/255.0 green:33/255.0 blue:33/255.0 alpha:1]];
    [self.starsLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:17]];
    [self addSubview:self.starsLabel];
    
    UIColor *blueColor = [UIColor colorWithRed:7/255.0 green:108/255.0 blue:186/255.0 alpha:1];
    
    [self.repositoryButton setBackgroundImage:[UIImage imageWithColor:blueColor] forState:UIControlStateHighlighted];
    [self.repositoryButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.repositoryButton setTitleColor:blueColor forState:UIControlStateNormal];
    [self.repositoryButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:17]];
    [self.repositoryButton.layer setCornerRadius:3];
    [self.repositoryButton.layer setBorderColor:blueColor.CGColor];
    [self.repositoryButton.layer setBorderWidth:1];
    [self.repositoryButton setClipsToBounds:YES];
    [self.repositoryButton setTitle:@"View in GitHub" forState:UIControlStateNormal];
    [self.repositoryButton addTarget:self action:@selector(viewRepository:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.repositoryButton];
    
    [self.descriptionTextView setTextColor:[UIColor colorWithWhite:0.2 alpha:1]];
    [self.descriptionTextView setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:16]];
    [self.descriptionTextView setEditable:NO];
    [self.descriptionTextView setBackgroundColor:[UIColor clearColor]];
    [self.descriptionTextView setTextContainerInset:UIEdgeInsetsZero];
    [self addSubview:self.descriptionTextView];
}

- (void)viewRepository:(UIButton *)repositoryButton {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.repositoryURL]];
}

- (void)setupConstraints {
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.top.equalTo(@20);
    }];
    
    [self.starImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@-20);
        make.centerY.equalTo(self.nameLabel).offset(-1.5);
        make.size.equalTo(@19);
    }];
    
    [self.starsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.starImageView.mas_left).offset(-5);
        make.centerY.equalTo(self.starImageView).offset(1.5);
    }];
    
    [self.repositoryButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(15);
        make.centerX.equalTo(self.repositoryButton.superview);
        make.width.equalTo(@(self.repositoryButton.intrinsicContentSize.width+12));
        make.height.equalTo(@(self.repositoryButton.intrinsicContentSize.height-6));
    }];
    
    [self.descriptionTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.repositoryButton.mas_bottom).offset(15);
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
        make.height.equalTo(@250);
        
        if ([UIScreen mainScreen].bounds.size.width <= 400) {
            make.width.equalTo(@280);
        } else {
            make.width.equalTo(self.superview.mas_width).dividedBy(2.25);
        }
    }];
}

+ (instancetype)contentViewWithRepositoryName:(NSString *)name stars:(NSInteger)stars description:(NSString *)description repositoryURL:(NSString *)url {
    DRGitHubRepositoryContentView *contentView = [self new];
    
    [contentView.descriptionTextView setText:description];
    [contentView.starsLabel setText:[NSString stringWithFormat:@"%i", stars]];
    [contentView.nameLabel setText:name];
    [contentView.descriptionTextView setText:description];
    [contentView setRepositoryURL:url];
    
    return contentView;
}

@end
