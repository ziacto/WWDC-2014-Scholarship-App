//
//  DRImageContentView.h
//  DavidRoman
//
//  Created by David Román Aguirre on 09/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DRImageContentView : UIImageView

+ (instancetype)contentViewWithImage:(UIImage *)image;

- (void)setup;

@end
