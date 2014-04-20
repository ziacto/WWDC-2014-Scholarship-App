//
//  DRSectionViewController.h
//  DavidRoman
//
//  Created by David Román Aguirre on 08/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DRSectionView.h"
#import "DRSection.h"

@interface DRSectionViewController : UIViewController

@property (strong, nonatomic) DRSectionView *view;
@property (strong, nonatomic) DRSection *currentSection;

@end
