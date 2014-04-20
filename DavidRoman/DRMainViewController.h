//
//  DRMainViewController.h
//  DavidRoman
//
//  Created by David Román Aguirre on 03/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DRMainView.h"
#import "DRSection.h"
#import "DRSectionViewControllerAnimator.h"
#import "DRSectionViewController.h"
#import "DRAudioPlayer.h"

@interface DRMainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIViewControllerTransitioningDelegate>

@property (retain, nonatomic) DRMainView *view;

@property (strong, nonatomic) NSArray *sections;

@property (strong, nonatomic) DRSectionViewController *sectionViewController;
@property (strong, nonatomic) DRSectionViewControllerAnimator *animator;

- (void)addSection:(DRSection *)section;

@end
