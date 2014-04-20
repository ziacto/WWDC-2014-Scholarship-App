//
//  DRTableViewCell.m
//  DavidRoman
//
//  Created by David Román Aguirre on 12/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import "DRTableViewCell.h"

#import "DRAudioPlayer.h"
#import "UIImage+Tint.h"

#import "Masonry.h"

@implementation DRTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
        [self setupSubviews];
        [self setupConstraints];
    }
    
    return self;
}

- (void)setup {
    self.speakerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self hideSpeakerButton];
}

- (void)setupSubviews {
    [self.speakerButton setImage:[[UIImage imageNamed:@"speaker"] imageTintedWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [self.speakerButton addTarget:self action:@selector(didTapSpeakerButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.speakerButton];
}

- (void)didTapSpeakerButton:(UIButton *)speakerButton {
    if ([[DRAudioPlayer sharedPlayer] isPlaying]) {
        [self setSpeakerButtonIconToMute];
        [[DRAudioPlayer sharedPlayer] pause];
    } else {
        [self setSpeakerButtonIconToSpeaker];
        [[DRAudioPlayer sharedPlayer] play];
    }
}

- (void)setSpeakerButtonIconToSpeaker {
    [self.speakerButton setImage:[[UIImage imageNamed:@"speaker"] imageTintedWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
}

- (void)setSpeakerButtonIconToMute {
    [self.speakerButton setImage:[[UIImage imageNamed:@"mute"] imageTintedWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
}

- (void)setupConstraints {
    [self.speakerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@0);
        make.centerY.equalTo(self);
        make.height.equalTo(self);
        make.width.equalTo(@63);
    }];
}

- (void)showSpeakerButton {
    [UIView animateWithDuration:0.2 animations:^{
        [self.speakerButton setAlpha:1];
    }];
}

- (void)hideSpeakerButton {
    [UIView animateWithDuration:0.2 animations:^{
        [self.speakerButton setAlpha:0];
    }];
}

@end
