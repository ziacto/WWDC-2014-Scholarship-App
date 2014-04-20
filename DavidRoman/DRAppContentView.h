//
//  DRAppContentView.h
//  DavidRoman
//
//  Created by David Román Aguirre on 09/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DRAppContentView : UIView

@property (strong, nonatomic) UIImageView *iconImageView;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UITextView *descriptionTextView;
@property (strong, nonatomic) UIButton *downloadButton;
@property (strong, nonatomic) NSString *downloadURL;

+ (instancetype)contentViewWithAppIcon:(UIImage *)icon name:(NSString *)name description:(NSString *)description downloadURL:(NSString *)url;

@end
