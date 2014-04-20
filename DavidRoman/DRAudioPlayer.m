//
//  DRAudioPlayer.m
//  DavidRoman
//
//  Created by David Román Aguirre on 11/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import "DRAudioPlayer.h"

#import "JPSDisplayLink.h"

NSString * const DRAudioPlayerDidStartPlayingNotification = @"DRAudioPlayerDidStartPlayingNotification";
NSString * const DRAudioPlayerDidPausePlayingNotification = @"DRAudioPlayerDidPausePlayingNotification";
NSString * const DRAudioPlayerDidEndPlayingNotification = @"DRAudioPlayerDidEndPlayingNotification";

static DRAudioPlayer *sharedInstance;

@implementation DRAudioPlayer

+ (instancetype)sharedPlayer {
    if (!sharedInstance) {
        sharedInstance = [DRAudioPlayer new];
    }
    
    return sharedInstance;
}

- (void)playNewAudioWithName:(NSString *)name type:(NSString *)type completion:(void (^)(void))completion {
    if ([sharedInstance.playingAudioName isEqualToString:name]) return;
    
    [[DRAudioPlayer sharedPlayer] setVolume:0 completion:^{
        NSURL *path = [[NSURL alloc] initWithString:[[NSBundle mainBundle] pathForResource:name ofType:type]];
        
        sharedInstance = [[DRAudioPlayer alloc] initWithContentsOfURL:path error:nil];
        [sharedInstance setPlayingAudioName:name];
        [sharedInstance playProgressivelyWithCompletion:completion];
    }];
}

- (void)setVolume:(float)volume completion:(void (^)(void))completion {
    if (![[DRAudioPlayer sharedPlayer] playingAudioName]) {
        if (completion) completion();
        return;
    }
    
    CGFloat initialVolume = abs([DRAudioPlayer sharedPlayer].volume);
    
    [JPSDisplayLink runDisplayLinkWithDuration:0.7 block:^(CGFloat progress) {
        if (initialVolume > volume) progress = -progress;
        [super setVolume:initialVolume+progress];
        if (abs(progress) == 1 && completion) completion();
    }];
}

- (BOOL)playProgressivelyWithCompletion:(void (^)(void))completion {
    if ([super play]) {
        [self setVolume:1 completion:completion];
        [[NSNotificationCenter defaultCenter] postNotificationName:DRAudioPlayerDidStartPlayingNotification object:self];
        
        return YES;
    }
    
    return NO;
}

- (BOOL)play {
    return [self playProgressivelyWithCompletion:nil];
}

- (void)stop {
    [super stop];
    
    [sharedInstance setPlayingAudioName:nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:DRAudioPlayerDidEndPlayingNotification object:self];
}

- (void)pauseProgressivelyWithCompletion:(void (^)(void))completion {
    if (!self.playingAudioName) {
        if (completion) completion();
        return;
    }
    
    [self setVolume:0 completion:^{
        [super pause];
        if (completion) completion();
        [[NSNotificationCenter defaultCenter] postNotificationName:DRAudioPlayerDidPausePlayingNotification object:sharedInstance];
    }];
}

- (void)pause {
    [self pauseProgressivelyWithCompletion:nil];
}

@end
