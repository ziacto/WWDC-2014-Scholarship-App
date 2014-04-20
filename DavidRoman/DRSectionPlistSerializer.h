//
//  DRSectionPlistSerializer.h
//  DavidRoman
//
//  Created by David Román Aguirre on 14/04/14.
//  Copyright (c) 2014 David Román Aguirre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DRSectionPlistSerializer : NSObject

+ (NSArray *)sectionsByReadingPlistNamed:(NSString *)plistName;

@end
