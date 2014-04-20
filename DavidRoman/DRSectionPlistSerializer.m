//
//  DRSectionPlistSerializer.m
//  DavidRoman
//
//  Created by David Román Aguirre on 14/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import "DRSectionPlistSerializer.h"

#import "DRSection.h"
#import "DRContentViews.h"

@implementation DRSectionPlistSerializer

+ (NSArray *)sectionsByReadingPlistNamed:(NSString *)plistName {
    NSArray *sectionsArray = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"]];
    
    __block NSArray *sections = [NSArray new];

    [sectionsArray enumerateObjectsUsingBlock:^(NSDictionary *sectionDictionary, NSUInteger idx, BOOL *stop) {
        NSString *title = sectionDictionary[@"title"];
        NSString *audioFilename = sectionDictionary[@"audioFilename"];
        NSString *audioExtension = sectionDictionary[@"audioExtension"];
        NSArray *contentViewsArray = sectionDictionary[@"contentViews"];
        
        __block NSArray *contentViews = [NSArray new];
        
        [contentViewsArray enumerateObjectsUsingBlock:^(NSDictionary *contentViewDictionary, NSUInteger idx, BOOL *stop) {
            NSString *type = contentViewDictionary[@"type"];
            
            if ([type isEqualToString:@"DRTextContentView"]) {
                DRTextContentView *contentView = [DRTextContentView contentViewWithText:contentViewDictionary[@"text"]];
                
                contentViews = [contentViews arrayByAddingObject:contentView];
            } else if ([type isEqualToString:@"DRImageContentView"]) {
                DRImageContentView *contentView = [DRImageContentView contentViewWithImage:[UIImage imageNamed:contentViewDictionary[@"imageName"]]];
                
                contentViews = [contentViews arrayByAddingObject:contentView];
            } else if ([type isEqualToString:@"DRMusicAlbumContentView"]) {
                DRMusicAlbumContentView *contentView = [DRMusicAlbumContentView contentViewWithAlbumImage:[UIImage imageNamed:contentViewDictionary[@"imageName"]] albumURL:contentViewDictionary[@"url"]];
                
                contentViews = [contentViews arrayByAddingObject:contentView];
            } else if ([type isEqualToString:@"DRAppContentView"]) {
                DRAppContentView *contentView = [DRAppContentView contentViewWithAppIcon:[UIImage imageNamed:contentViewDictionary[@"iconName"]] name:contentViewDictionary[@"name"] description:contentViewDictionary[@"description"] downloadURL:contentViewDictionary[@"url"]];
                
                contentViews = [contentViews arrayByAddingObject:contentView];
            } else if ([type isEqualToString:@"DRGitHubRepositoryContentView"]) {
                DRGitHubRepositoryContentView *contentView = [DRGitHubRepositoryContentView contentViewWithRepositoryName:contentViewDictionary[@"name"] stars:[contentViewDictionary[@"stars"] integerValue] description:contentViewDictionary[@"description"] repositoryURL:contentViewDictionary[@"url"]];
                
                contentViews = [contentViews arrayByAddingObject:contentView];
            } else if ([type isEqualToString:@"DRButtonContentView"]) {
                DRButtonContentView *contentView = [DRButtonContentView contentViewWithTitle:contentViewDictionary[@"title"] url:contentViewDictionary[@"url"]];
                
                contentViews = [contentViews arrayByAddingObject:contentView];
            }
        }];
        
        DRSection *section = [DRSection sectionWithTitle:title audioFilename:audioFilename audioExtension:audioExtension];
        [section setContentViews:contentViews];
        
        sections = [sections arrayByAddingObject:section];
    }];
     
    return sections;
}

@end
