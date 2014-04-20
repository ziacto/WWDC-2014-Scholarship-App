//
//  DRNavigationItem.h
//  DavidRoman
//
//  Created by David Román Aguirre on 11/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DRNavigationItem : UINavigationItem

@property (strong, nonatomic) UIBarButtonItem *firstButton;
@property (strong, nonatomic) UIBarButtonItem *secondButton;

@property (copy, nonatomic) void(^didTapFirstRightButtonBlock)(DRNavigationItem *);
@property (copy, nonatomic) void(^didTapSecondRightButtonBlock)(DRNavigationItem *);

@end
