//
//  DRSectionViewScrollView.m
//  DavidRoman
//
//  Created by David Román Aguirre on 09/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import "DRSectionViewScrollView.h"

#import "Masonry.h"

@implementation DRSectionViewScrollView

- (id)init {
    if (self = [super init]) {
        [self setup];
        [self setupSubviews];
    }
    
    return self;
}

- (void)setup {
    [self setIndicatorStyle:UIScrollViewIndicatorStyleWhite];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.contentOffset.y <= 0) self.layer.mask = nil;
    else [self reloadFadingWithPercentage:self.contentOffset.y/(0.25*self.bounds.size.height)];
    
    [self reloadContentSize];
}

- (void)reloadContentSize {
    __block CGFloat height = 0;
    
    [self.contentView.subviews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger index, BOOL *stop) {
        CGFloat possibleHeight = view.frame.origin.y + view.frame.size.height;
        if (possibleHeight > height) height = possibleHeight;
    }];
    
    [self setContentSize:CGSizeMake(self.frame.size.width, MAX(height+15, self.frame.size.height))];
    [self.contentView setFrame:CGRectMake(0, 0, self.contentSize.width, self.contentSize.height)];
}

- (void)setupSubviews {
    self.contentView = [UIView new];
    
    [self.contentView setBackgroundColor:[UIColor clearColor]];
    [self.contentView setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self.contentView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    
    [self addSubview:self.contentView];
}

- (void)reloadFadingWithPercentage:(CGFloat)percentage {
    percentage = MIN(percentage, 1);
    
    NSObject *transparent = (NSObject *)[[UIColor colorWithWhite:0 alpha:0] CGColor];
    NSObject *opaque = (NSObject *)[[UIColor colorWithWhite:0 alpha:1] CGColor];
    
    CALayer *maskLayer = [CALayer layer];
    
    maskLayer.frame = self.bounds;
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    
    [gradientLayer setFrame:CGRectMake(self.bounds.origin.x, 0, self.bounds.size.width, self.bounds.size.height)];
    [gradientLayer setColors:@[transparent, opaque, opaque]];
    [gradientLayer setLocations:@[@0, @(percentage*0.25), @1]];
    
    [maskLayer addSublayer:gradientLayer];
    
    self.layer.mask = maskLayer;
}

- (void)addSubviews:(NSArray *)subviews {
    [subviews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        [self.contentView addSubview:view];
        
        UIView *previousView = i > 0 ? subviews[i-1] : nil;
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            if (previousView) make.top.equalTo(previousView.mas_bottom).offset(20);
            else make.top.equalTo(@5);
        }];
    }];
}

@end
