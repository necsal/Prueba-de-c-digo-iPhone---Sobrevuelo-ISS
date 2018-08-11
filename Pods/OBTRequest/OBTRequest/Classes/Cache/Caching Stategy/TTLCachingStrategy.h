//
//  TTLCacheStrategy.h
//  OBTRequest
//
//  Created by Cristina Folgueral Gutiérrez on 17/4/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CachingStrategy.h"

@interface TTLCachingStrategy : NSObject <CachingStrategy>{
    NSTimeInterval _timeToLapse;
}

- (id) initWithTimeToLapse:(NSTimeInterval ) timeToLapse;

@end
