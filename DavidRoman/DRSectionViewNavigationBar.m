//
//  DRSectionViewNavigationBar.m
//  DavidRoman
//
//  Created by David Román Aguirre on 11/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import "DRSectionViewNavigationBar.h"

#import "UIImage+ImageWithColor.h"

@implementation DRSectionViewNavigationBar

- (id)init {
    if (self = [super init]) {
        [self setup];
    }
    
    return self;
}

- (void)setup {
    self.mainItem = [DRNavigationItem new];
    [self.mainItem.firstButton setImage:[UIImage imageNamed:@"speaker"]];
    [self.mainItem.secondButton setImage:[UIImage imageNamed:@"arrow"]];
    [self setItems:@[self.mainItem]];
    
    [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self setShadowImage:[UIImage imageWithColor:[UIColor colorWithWhite:1 alpha:0]]];
}

@end
