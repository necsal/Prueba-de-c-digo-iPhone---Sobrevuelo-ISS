//
//  RequestAsynchronous.h
//  OBTRequest
//
//  Created by Cristina Folgueral Gutiérrez on 23/4/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#import "Request.h"
#import "RequestAsynchronousDelegate.h"

@interface RequestAsynchronous : Request{

}

- (id) initWithServer:(NSString*)server;

- (void) executeWithDelegate:(id<RequestAsynchronousDelegate>) delegate andRequestCachingStrategy:(RequestCachingStrategy *) requestCachingStrategy;
- (void) cancelRequest;

@end
