//
//  DRSection.h
//  DavidRoman
//
//  Created by David Román Aguirre on 12/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DRSection : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *audioFilename;
@property (strong, nonatomic) NSString *audioExtension;
@property (strong, nonatomic) NSArray *contentViews;

+ (instancetype)sectionWithTitle:(NSString *)title audioFilename:(NSString *)filename audioExtension:(NSString *)extension;

- (void)addContentView:(UIView *)contentView;

@end
