//
//  Request+Protected.h
//  OBTRequest
//
//  Created by Cristina Folgueral Gutiérrez on 23/4/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#ifndef OBTRequest_Request_Protected_h
#define OBTRequest_Request_Protected_h

@interface Request (Protected)
- (void) reqLog:(NSString *) log forLogLevel:(RequestLogLevel) level;

- (id) initWithServer:(NSString*)server;
- (void) composeURLRequest;
- (void) composeUrl;
- (BOOL) isValidHTTPStatusCode;
- (BOOL) internetConnectionAvaliable;
- (void) saveRequestDataToCache:(NSData *) data;
- (NSData *) dataForCachingStrategy:(id<CachingStrategy>) cachingStrategy;
- (NSData *) getMockedOrCachedDataForCatchingStrategy:(id<CachingStrategy>) cachingStrategy;

@end


#endif
