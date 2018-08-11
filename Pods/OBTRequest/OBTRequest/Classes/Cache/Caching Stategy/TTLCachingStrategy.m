//
//  TTLCacheStrategy.m
//  OBTRequest
//
//  Created by Cristina Folgueral Gutiérrez on 17/4/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#import "TTLCachingStrategy.h"

@implementation TTLCachingStrategy


- (id) initWithTimeToLapse:(NSTimeInterval ) timeToLapse{
    self = [super init];
    if(self){
        _timeToLapse = timeToLapse;
    }
    return self;
}

- (BOOL) isObjectValid:(id) object withPersistedTime:(NSTimeInterval) timeInterval{
    if(object)
        return (timeInterval + _timeToLapse) > [[NSDate date] timeIntervalSince1970];
    else
        return false;
}

@end
