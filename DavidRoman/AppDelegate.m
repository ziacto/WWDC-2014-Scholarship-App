//
//  AppDelegate.m
//  DavidRoman
//
//  Created by David Román Aguirre on 03/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import "AppDelegate.h"

#import "DRMainViewController.h"
#import "DRSectionPlistSerializer.h"

#import "Masonry.h"

@implementation AppDelegate

- (id)init {
    if (self = [super init]) {
        [self setup];
        [self setupRootViewController];
    }
    
    return self;
}

- (void)setup {
    self.window = [DRBlurryWindow new];
    
    [self.window.backgroundImageView setImage:[UIImage imageNamed:@"background"]];
    
    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
}

- (void)setupRootViewController {
    DRMainViewController *mainViewController = [DRMainViewController new];
    
    NSArray *sections = [DRSectionPlistSerializer sectionsByReadingPlistNamed:@"Sections"];
    
    [sections enumerateObjectsUsingBlock:^(DRSection *section, NSUInteger idx, BOOL *stop) {
        [mainViewController addSection:section];
    }];
    
    /* DRSection *aboutMeSection = [DRSection sectionWithTitle:@"About me" audioFilename:@"AboutMe" audioExtension:@"mp3"];

    [aboutMeSection addContentView:[DRGitHubRepositoryContentView contentViewWithRepositoryName:@"PDGestureTableView" stars:290 description:@"This is awesome" repositoryURL:@"https://github.com/Dromaguirre/PDGestureTableView"]];
    [aboutMeSection addContentView:[DRMusicAlbumContentView contentViewWithAlbumImage:[UIImage imageNamed:@"lorde_pure_heroine"] albumURL:@"https://itunes.apple.com/us/album/pure-heroine/id703590196"]];
    [aboutMeSection addContentView:[DRImageContentView contentViewWithImage:[UIImage imageNamed:@"lola_and_me"]]];
    [aboutMeSection addContentView:[DRImageContentView contentViewWithImage:[UIImage imageNamed:@"img"]]]; */
    
    [self.window setRootViewController:mainViewController];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    if ([[DRAudioPlayer sharedPlayer] playingAudioName]) [[DRAudioPlayer sharedPlayer] play];
}

@end
