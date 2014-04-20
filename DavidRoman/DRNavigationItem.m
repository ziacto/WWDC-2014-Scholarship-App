//
//  DRNavigationItem.m
//  DavidRoman
//
//  Created by David Román Aguirre on 11/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import "DRNavigationItem.h"

#import "Masonry.h"

@interface DRNavigationItem ()

@property (strong, nonatomic) UILabel *titleLabel;

@end

@implementation DRNavigationItem

- (id)init {
    if (self = [super init]) {
        [self setup];
    }
    
    return self;
}

- (void)setup {
    self.titleLabel = [UILabel new];
    [self.titleLabel setTextColor:[UIColor whiteColor]];
    [self.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:17]];
    [self.titleLabel setAdjustsFontSizeToFitWidth:YES];
    [self.titleLabel setMinimumScaleFactor:0.6];
    [self.titleLabel setFrame:CGRectMake(0, 0, 200, 44)];
    
    UIBarButtonItem *leftSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    [leftSpace setWidth:5];
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.titleLabel];
    
    [self setLeftBarButtonItems:@[leftSpace, leftBarButtonItem]];
    
    self.firstButton = [[UIBarButtonItem alloc] initWithImage:nil style:UIBarButtonItemStylePlain target:self action:@selector(didTapFirstRightButtonBlock:)];
    [self.firstButton setImageInsets:UIEdgeInsetsMake(4, 5, 0, -5)];
    self.secondButton = [[UIBarButtonItem alloc] initWithImage:nil style:UIBarButtonItemStylePlain target:self action:@selector(didTapSecondRightButtonBlock:)];
    [self.secondButton setImageInsets:UIEdgeInsetsMake(4, -5, 0, 0)];
    
    UIBarButtonItem *rightSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    [rightSpace setWidth:5];
    
    [self setRightBarButtonItems:@[rightSpace, self.secondButton, self.firstButton]];
}

+ (instancetype)itemWithFirstButtonImage:(UIImage *)firstImage secondButtonImage:(UIImage *)secondImage {
    DRNavigationItem *item = [self new];
    
    [item.firstButton setImage:firstImage];
    [item.secondButton setImage:secondImage];
    
    return item;
}

- (void)setTitle:(NSString *)title {
    [self.titleLabel setText:title];
}

- (void)didTapFirstRightButtonBlock:(UIBarButtonItem *)barButtonItem {
    if (self.didTapFirstRightButtonBlock) self.didTapFirstRightButtonBlock(self);
}

- (void)didTapSecondRightButtonBlock:(UIBarButtonItem *)barButtonItem {
    if (self.didTapSecondRightButtonBlock) self.didTapSecondRightButtonBlock(self);
}

@end
