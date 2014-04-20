//
//  DRSectionView.h
//  DavidRoman
//
//  Created by David Román Aguirre on 09/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DRSectionViewNavigationBar.h"
#import "DRSectionViewScrollView.h"

@interface DRSectionView : UIView <UIBarPositioningDelegate>

@property (strong, nonatomic) DRSectionViewNavigationBar *navigationBar;
@property (strong, nonatomic) DRSectionViewScrollView *scrollView;

- (void)showScrollViewAnimatedly:(BOOL)animatedly;
- (void)hideScrollViewAnimatedly:(BOOL)animatedly;

@end
