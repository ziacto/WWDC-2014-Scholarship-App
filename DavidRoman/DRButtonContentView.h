//
//  DRButtonContentView.h
//  DavidRoman
//
//  Created by David Román Aguirre on 14/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DRButtonContentView : UIButton

+ (instancetype)contentViewWithTitle:(NSString *)title url:(NSString *)url;

@property (strong, nonatomic) NSString *buttonURL;

@end
