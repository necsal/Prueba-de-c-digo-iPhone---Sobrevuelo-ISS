//
//  RequestSynchronous.m
//  OBTRequest
//
//  Created by Cristina Folgueral Gutiérrez on 23/4/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#import "RequestSynchronous.h"
#import "Request+Protected.h"
#import "NSError+OBTRequest.h"

@interface RequestSynchronous ()

@end

@implementation RequestSynchronous

- (id)initWithServer:(NSString *)server {
    self = [super initWithServer:server];
    if (self) {
    }
    return self;
}

- (NSData *)executeWithRequestCachingStrategy:(RequestCachingStrategy *)requestCachingStrategy error:(NSError **)error {
    _requestCachingStrategy = requestCachingStrategy;
    [self composeUrl];

    NSData *data = [self getMockedOrCachedDataForCatchingStrategy:requestCachingStrategy.mainStrategy];
    if (!data) {
        data = [self getDataFromInternetOrCacheError:error];
    }
    return data;
}

- (NSData *)getDataFromInternetOrCacheError:(NSError **)error {
    [self composeURLRequest];
    NSURLResponse *response = nil;
    NSError *requestError = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:_request returningResponse:&response error:&requestError];
    if (requestError) {
        [self reqLog:[NSString stringWithFormat:@"Request %@ - Request error %@", _url, requestError] forLogLevel:RequestLogLevelInfo];
        if (![self internetConnectionAvaliable]) {
            data = [self getDataOnCacheWithCachingStrategy:_requestCachingStrategy.noInternetStrategy];
            if (!data)
                *error = [NSError OBTErrorWithCode:OBTRequestErrorNoInternet];
        } else {
            NSData *cachedData = [self getDataOnCacheWithCachingStrategy:_requestCachingStrategy.serverErrorStrategy];
            if (!cachedData) {
                NSError *errorToSend = [NSError OBTErrorWithCode:OBTRequestErrorUnknown];
                if (requestError.code == NSURLErrorUserCancelledAuthentication)
                    errorToSend = [NSError OBTEHTTPErrorWithHTTPCode:401];
                *error = errorToSend;
            } else {
                data = cachedData;
            }
        }
    } else {
        _response = (NSHTTPURLResponse *)response;
        [self reqLog:[NSString stringWithFormat:@"Request %@ - Response Status CODE %d", _url, (int)_response.statusCode] forLogLevel:RequestLogLevelInfo];
        [self reqLog:[NSString stringWithFormat:@"Request %@ - JSON response: %@", _url, [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]] forLogLevel:RequestLogLevelInfo];
        if ([self isValidHTTPStatusCode]) {
            if ([self isResponseDataSafeForCaching]) {
                [self saveRequestDataToCache:data];
            }
        } else {
            NSData *cachedData = [self getDataOnCacheWithCachingStrategy:_requestCachingStrategy.serverErrorStrategy];
            if (!cachedData) {
                *error = [NSError OBTEHTTPErrorWithHTTPCode:(int)_response.statusCode];
            } else {
                data = cachedData;
            }
        }
    }

    return data;
}

- (NSData *)getDataOnCacheWithCachingStrategy:(id<CachingStrategy>)cachingStrategy {
    return [self dataForCachingStrategy:cachingStrategy];
}

@end
