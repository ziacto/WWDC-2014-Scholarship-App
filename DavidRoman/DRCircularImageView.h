//
//  DRCircularImageView.h
//  DavidRoman
//
//  Created by David Román Aguirre on 03/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DRCircularImageView : UIView

/**
 Since this class should allow setting both corner radius and shadow, this class inherits from a UIView, which is the container of the imageView, where shadows are set.
*/
@property (strong, nonatomic) UIImageView *imageView;

@end
