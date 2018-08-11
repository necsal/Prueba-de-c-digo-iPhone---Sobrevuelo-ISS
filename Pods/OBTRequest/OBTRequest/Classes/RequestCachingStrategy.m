//
//  RequestCachingStrategy.m
//  OBTRequest
//
//  Created by Cristina Folgueral Gutiérrez on 17/4/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#import "RequestCachingStrategy.h"

@implementation RequestCachingStrategy

- (id) initWithMainStrategy:(id<CachingStrategy>) mainStrategy withNoInternetStrategy:(id<CachingStrategy>) noInternetStrategy andServerErrorStrategy:(id<CachingStrategy>) serverErrorStrategy{
    self = [super init];
    if(self){
        _mainStrategy = mainStrategy;
        _noInternetStrategy = noInternetStrategy;
        _serverErrorStrategy = serverErrorStrategy;
    }
    return self;
}

@end
