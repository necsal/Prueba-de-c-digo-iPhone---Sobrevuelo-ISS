//
//  RequestCachingStrategy.h
//  OBTRequest
//
//  Created by Cristina Folgueral Gutiérrez on 17/4/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CachingStrategy.h"

@interface RequestCachingStrategy : NSObject{
    
}

@property (nonatomic, readonly) id<CachingStrategy> mainStrategy;
@property (nonatomic, readonly) id<CachingStrategy> noInternetStrategy;
@property (nonatomic, readonly) id<CachingStrategy> serverErrorStrategy;


- (id) initWithMainStrategy:(id<CachingStrategy>) mainStrategy withNoInternetStrategy:(id<CachingStrategy>) noInternetStrategy andServerErrorStrategy:(id<CachingStrategy>) serverErrorStrategy;

@end
