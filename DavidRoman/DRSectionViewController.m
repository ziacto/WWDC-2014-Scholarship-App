//
//  DRSectionViewController.m
//  DavidRoman
//
//  Created by David Román Aguirre on 08/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import "DRSectionViewController.h"

#import "DRAudioPlayer.h"

#import "Masonry.h"

@implementation DRSectionViewController

- (void)loadView {
    self.view = [DRSectionView new];
    
    __unsafe_unretained typeof(self) weakSelf = self;
    
    [self.view.navigationBar.mainItem setDidTapFirstRightButtonBlock:^(DRNavigationItem *item) {
        if ([[DRAudioPlayer sharedPlayer] isPlaying]) {
            [item.firstButton setImage:[UIImage imageNamed:@"mute"]];
            [[DRAudioPlayer sharedPlayer] pause];
        } else {
            [item.firstButton setImage:[UIImage imageNamed:@"speaker"]];
            
            if (![[DRAudioPlayer sharedPlayer] playingAudioName]) {
                [[DRAudioPlayer sharedPlayer] playNewAudioWithName:weakSelf.currentSection.audioFilename type:weakSelf.currentSection.audioExtension completion:nil];
            } else {
                [[DRAudioPlayer sharedPlayer] play];
            }
        }
    }];
    
    [self.view.navigationBar.mainItem setDidTapSecondRightButtonBlock:^(DRNavigationItem *item) {
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didStartPlaying:) name:DRAudioPlayerDidStartPlayingNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didPausePlaying:) name:DRAudioPlayerDidPausePlayingNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didEndPlaying:) name:DRAudioPlayerDidEndPlayingNotification object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - NSNotification Observer Methods -

- (void)didStartPlaying:(NSNotification *)notification {
    [self.view.navigationBar.mainItem.firstButton setImage:[UIImage imageNamed:@"speaker"]];
}

- (void)didPausePlaying:(NSNotification *)notification {
    [self.view.navigationBar.mainItem.firstButton setImage:[UIImage imageNamed:@"mute"]];
}

- (void)didEndPlaying:(NSNotification *)notification {
    [self.view.navigationBar.mainItem.firstButton setImage:[UIImage imageNamed:@"mute"]];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.view showScrollViewAnimatedly:YES];
    
    [[DRAudioPlayer sharedPlayer] playNewAudioWithName:self.currentSection.audioFilename type:self.currentSection.audioExtension completion:nil];
}

- (void)setCurrentSection:(DRSection *)currentSection {
    if (_currentSection != currentSection) {
        _currentSection = currentSection;
        [self.view.scrollView setContentOffset:CGPointZero];
        
        for (UIView *view in self.view.scrollView.contentView.subviews) {
            [view removeFromSuperview];
        }
        
        [self.view hideScrollViewAnimatedly:NO];
        
        [self.view.scrollView addSubviews:currentSection.contentViews];
        
        [self setTitle:currentSection.title];
    }
}

- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    
    [self.view.navigationBar.mainItem setTitle:title];
}

@end
