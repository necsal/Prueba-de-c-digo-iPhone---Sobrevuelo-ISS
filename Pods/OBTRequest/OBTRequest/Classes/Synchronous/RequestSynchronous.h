//
//  RequestSynchronous.h
//  OBTRequest
//
//  Created by Cristina Folgueral Gutiérrez on 23/4/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#import "Request.h"

@interface RequestSynchronous : Request{

}

- (id) initWithServer:(NSString*)server;
- (NSData *) executeWithRequestCachingStrategy:(RequestCachingStrategy *) requestCachingStrategy error:(NSError **) error;

@end
