//
//  DRMainViewController.m
//  DavidRoman
//
//  Created by David Román Aguirre on 03/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import "DRMainViewController.h"

#import "DRSectionViewController.h"

#import "DRBlurryWindow.h"

#import "DRTableViewCell.h"

@implementation DRMainViewController

- (id)init {
    if (self = [super init]) {
        self.sections = [NSArray new];
        self.sectionViewController = [DRSectionViewController new];
        self.animator = [DRSectionViewControllerAnimator new];
    }
    
    return self;
}

- (void)loadView {
    self.view = [DRMainView new];
    
    [self.view setAlpha:0];

    [self.view.headerImageView.imageView setImage:[UIImage imageNamed:@"me"]];
    
    [self.view.nameLabel setText:@"David Román Aguirre"];
    
    [self.view.tableView setDataSource:self];
    [self.view.tableView setDelegate:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.sectionViewController setTransitioningDelegate:self];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didStartPlaying:) name:DRAudioPlayerDidStartPlayingNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didPausePlaying:) name:DRAudioPlayerDidPausePlayingNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didEndPlaying:) name:DRAudioPlayerDidEndPlayingNotification object:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view setAlpha:1];
    }];
}

- (void)addSection:(DRSection *)section {
    self.sections = [self.sections arrayByAddingObject:section];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y > 0) return;
    
    CGFloat percentage = 1-fabsf(scrollView.contentOffset.y)/60;
    
    [[(DRBlurryWindow *)[[[UIApplication sharedApplication] windows] firstObject] backgroundImageView] setBlurPercentage:percentage];
    [self.view setAlpha:percentage];
    
    if (percentage < 0.5) [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    else [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - NSNotification Observer Methods -

- (NSIndexPath *)currentPlayingRowIndexPath {
    NSInteger indexForPlayingAudio = [self.sections indexOfObjectPassingTest:^BOOL(DRSection *obj, NSUInteger idx, BOOL *stop) {
        return [obj.audioFilename isEqualToString:[DRAudioPlayer sharedPlayer].playingAudioName];
    }];
    
    return [NSIndexPath indexPathForRow:indexForPlayingAudio inSection:0];
}

- (void)didStartPlaying:(NSNotification *)notification {
    DRTableViewCell *cell = (DRTableViewCell *)[self.view.tableView cellForRowAtIndexPath:[self currentPlayingRowIndexPath]];
    
    [self didEndPlaying:nil];
    [cell showSpeakerButton];
    [cell setSpeakerButtonIconToSpeaker];
}

- (void)didPausePlaying:(NSNotification *)notification {
    DRTableViewCell *cell = (DRTableViewCell *)[self.view.tableView cellForRowAtIndexPath:[self currentPlayingRowIndexPath]];
    
    [cell setSpeakerButtonIconToMute];
}

- (void)didEndPlaying:(NSNotification *)notification {
    for (NSInteger s = 0; s < [self.view.tableView numberOfSections]; s++) {
        for (NSInteger i = 0; i < [self.view.tableView numberOfRowsInSection:s]; i++) {
            DRTableViewCell *cell = (DRTableViewCell *)[self.view.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:s]];
            [cell hideSpeakerButton];
        }
    }
}

#pragma mark - UIViewControllerTransitioningDelegate -

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    [self.animator setPresenting:YES];
    return self.animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    [self.animator setPresenting:NO];
    return self.animator;
}

#pragma mark - UITableViewDataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.sections count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Section Cell Identifier";
    
    DRTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[DRTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        [cell.textLabel setTextColor:[UIColor whiteColor]];
        [cell.textLabel setHighlightedTextColor:[UIColor blackColor]];
        
        UIView *backgroundView = [UIView new];
        [backgroundView setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.6]];
        
        [cell setBackgroundColor:[UIColor clearColor]];
        [cell setSelectedBackgroundView:backgroundView];
    }
    
    [cell.textLabel setText:[(DRSection *)self.sections[indexPath.row] title]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.sectionViewController setCurrentSection:self.sections[indexPath.row]];
    [self presentViewController:self.sectionViewController animated:YES completion:nil];
}

@end
