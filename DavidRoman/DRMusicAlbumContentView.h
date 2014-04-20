//
//  DRMusicAlbumContentView.h
//  DavidRoman
//
//  Created by David Román Aguirre on 09/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DRImageContentView.h"

@interface DRMusicAlbumContentView : DRImageContentView

+ (instancetype)contentViewWithAlbumImage:(UIImage *)image albumURL:(NSString *)url;

@property (strong, nonatomic) NSString *albumURL;

@end
