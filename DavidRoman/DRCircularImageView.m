//
//  DRCircularImageView.m
//  DavidRoman
//
//  Created by David Román Aguirre on 03/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import "DRCircularImageView.h"

#import "Masonry.h"

@implementation DRCircularImageView

- (id)init {
    if (self = [super init]) {
        [self setup];
        [self setupConstraints];
    }
    
    return self;
}

- (void)setup {
    self.imageView = [UIImageView new];
    
    [self.imageView.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.imageView.layer setBorderWidth:1.5];
    [self.imageView setClipsToBounds:YES];
    
    [self addSubview:self.imageView];
}

- (void)setupConstraints {
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.layer setCornerRadius:self.frame.size.width/2];
    [self.imageView.layer setCornerRadius:self.frame.size.width/2];
}

@end
