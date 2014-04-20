//
//  DRMainView.m
//  DavidRoman
//
//  Created by David Román Aguirre on 05/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import "DRMainView.h"

#import "UIView+Shadow.h"
#import "UIView+MotionEffects.h"

#import "Masonry.h"

@implementation DRMainView

- (id)init {
    if (self = [super init]) {
        [self setup];
        [self setupSubviews];
        [self setupConstraints];
    }
    
    return self;
}

- (void)setup {
    self.headerImageView = [DRCircularImageView new];
    self.nameLabel = [UILabel new];
    self.tableView = [UITableView new];
}

- (void)setupSubviews {
    [self.headerImageView setShadowWithColor:[UIColor colorWithWhite:0 alpha:0.45] offset:CGSizeMake(0, 1) radius:2];
    [self.headerImageView addMotionEffectsWithRatio:15];
    [self addSubview:self.headerImageView];
    
    [self.nameLabel setTextColor:[UIColor whiteColor]];
    [self.nameLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:21]];
    [self.nameLabel setShadowWithColor:[UIColor colorWithWhite:0 alpha:0.45] offset:CGSizeMake(0, 1) radius:2];
    [self.nameLabel addMotionEffectsWithRatio:15];
    [self addSubview:self.nameLabel];
    
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setTableFooterView:[UIView new]];
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 20, 0, 20)];
    [self.tableView setSeparatorColor:[UIColor colorWithWhite:1 alpha:0.1]];
    [self addSubview:self.tableView];
}

- (void)setupConstraints {
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@50);
        make.centerX.equalTo(self.headerImageView.superview);
        
        if ([UIScreen mainScreen].bounds.size.width <= 400) {
            make.width.equalTo(@118);
            make.height.equalTo(@118);
        } else {
            make.width.equalTo(@170);
            make.height.equalTo(@170);
        }
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerImageView.mas_bottom).with.offset(30);
        make.centerX.equalTo(self.nameLabel.superview);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).with.offset(30);
        make.bottom.equalTo(@0);
        make.left.equalTo(@0);
        make.right.equalTo(@0);
    }];
}

@end
