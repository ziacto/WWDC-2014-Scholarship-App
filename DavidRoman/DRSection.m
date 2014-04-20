//
//  DRSection.m
//  DavidRoman
//
//  Created by David Román Aguirre on 12/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import "DRSection.h"

@implementation DRSection

- (id)init {
    if (self = [super init]) {
        [self setup];
    }
    
    return self;
}

- (void)setup {
    self.contentViews = [NSArray new];
}

+ (instancetype)sectionWithTitle:(NSString *)title audioFilename:(NSString *)filename audioExtension:(NSString *)extension {
    DRSection *section = [DRSection new];
    
    [section setTitle:title];
    [section setAudioFilename:filename];
    [section setAudioExtension:extension];
    
    return section;
}

- (void)addContentView:(UIView *)contentView {
    self.contentViews = [self.contentViews arrayByAddingObject:contentView];
}

@end
