//
//  DRGitHubRepositoryContentView.h
//  DavidRoman
//
//  Created by David Román Aguirre on 14/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DRGitHubRepositoryContentView : UIView

@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *starsLabel;
@property (strong, nonatomic) UIButton *repositoryButton;
@property (strong, nonatomic) NSString *repositoryURL;
@property (strong, nonatomic) UITextView *descriptionTextView;

+ (instancetype)contentViewWithRepositoryName:(NSString *)name stars:(NSInteger)stars description:(NSString *)description repositoryURL:(NSString *)url;

@end
