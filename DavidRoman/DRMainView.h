//
//  DRMainView.h
//  DavidRoman
//
//  Created by David Román Aguirre on 05/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DRCircularImageView.h"

@interface DRMainView : UIView

@property (strong, nonatomic) DRCircularImageView *headerImageView;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UITableView *tableView;

@end
