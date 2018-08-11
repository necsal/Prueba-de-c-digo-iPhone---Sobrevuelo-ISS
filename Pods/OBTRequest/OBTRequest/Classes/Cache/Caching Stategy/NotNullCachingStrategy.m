//
//  NotNullCachingStrategy.m
//  OBTRequest
//
//  Created by Cristina Folgueral Gutiérrez on 17/4/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#import "NotNullCachingStrategy.h"

@implementation NotNullCachingStrategy

- (BOOL) isObjectValid:(id) object withPersistedTime:(NSTimeInterval) timeInterval{
    return object != nil;
}

@end
