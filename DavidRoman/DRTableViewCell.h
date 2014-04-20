//
//  DRTableViewCell.h
//  DavidRoman
//
//  Created by David Román Aguirre on 12/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DRTableViewCell : UITableViewCell

@property (strong, nonatomic) UIButton *speakerButton;

- (void)showSpeakerButton;
- (void)hideSpeakerButton;

- (void)setSpeakerButtonIconToSpeaker;
- (void)setSpeakerButtonIconToMute;

@end
