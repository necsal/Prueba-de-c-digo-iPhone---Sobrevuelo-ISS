//
//  CacheStrategy.h
//  OBTRequest
//
//  Created by Cristina Folgueral Gutiérrez on 17/4/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CachingStrategy <NSObject>

- (BOOL) isObjectValid:(id) object withPersistedTime:(NSTimeInterval) timeInterval;

@end
