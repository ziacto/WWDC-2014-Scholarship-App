//
//  DRAudioPlayer.h
//  DavidRoman
//
//  Created by David Román Aguirre on 11/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

extern NSString * const DRAudioPlayerDidStartPlayingNotification;
extern NSString * const DRAudioPlayerDidPausePlayingNotification;
extern NSString * const DRAudioPlayerDidEndPlayingNotification;

@interface DRAudioPlayer : AVAudioPlayer

+ (instancetype)sharedPlayer;

@property (strong, nonatomic) NSString *playingAudioName;

- (void)playNewAudioWithName:(NSString *)name type:(NSString *)type completion:(void (^)(void))completion;
- (BOOL)playProgressivelyWithCompletion:(void (^)(void))completion;
- (void)pauseProgressivelyWithCompletion:(void (^)(void))completion;

@end
