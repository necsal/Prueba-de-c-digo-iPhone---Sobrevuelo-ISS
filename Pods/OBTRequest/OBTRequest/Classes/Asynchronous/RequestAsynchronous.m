//
//  RequestAsynchronous.m
//  OBTRequest
//
//  Created by Cristina Folgueral Gutiérrez on 23/4/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#import "RequestAsynchronous.h"
#import "Request+Protected.h"
#import "NSError+OBTRequest.h"

@interface RequestAsynchronous(){
    id<RequestAsynchronousDelegate> _delegate;
    id _delegateTag; //para diferenciar peticiones
    NSMutableData *_data;
    NSURLConnection *_connection;
}

@end

@implementation RequestAsynchronous
- (id) initWithServer:(NSString*)server{
    self = [super initWithServer:server];
    if(self){
        
    }
    return self;
}

- (void) executeWithDelegate:(id<RequestAsynchronousDelegate>) delegate andRequestCachingStrategy:(RequestCachingStrategy *) requestCachingStrategy{
    _delegate = delegate;
    
    _requestCachingStrategy = requestCachingStrategy;
    [self composeUrl];
    
    NSData * data = [self getMockedOrCachedDataForCatchingStrategy:requestCachingStrategy.mainStrategy];
    if(data){
        [self notifySuccess:data];
    }else{
        [self composeURLRequest];
        [self sendRequestToInternet];
    }
}

- (void) sendRequestToInternet{
    _connection = [[NSURLConnection alloc] initWithRequest:_request delegate:self startImmediately:YES];
}

- (void) notifyError:(NSError *) error{
    [_delegate request:self withTag:_delegateTag didFinishedWithError:error];
}

- (void) notifySuccess:(NSData *) data{
    [_delegate request:self withTag:_delegateTag didFinishedWithResult:data];
}

- (void) checkDataOnCacheAndNotifyDelegateWithCachingStrategy:(id<CachingStrategy>) cachingStrategy andOnCaseError:(NSError *) error{
    NSData *data = [self dataForCachingStrategy:cachingStrategy];
    if(data){
        [self notifySuccess:data];
    }else{
        [self notifyError:error];
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection*)theConnection{
    [self reqLog:[NSString stringWithFormat:@"Request %@ - Response Status CODE %d", _url, (int)_response.statusCode] forLogLevel:RequestLogLevelInfo];
    [self reqLog:[NSString stringWithFormat:@"Request %@ - JSON response: %@",_url,[[NSString alloc] initWithData:_data encoding:NSUTF8StringEncoding]] forLogLevel:RequestLogLevelInfo];
    if([self isValidHTTPStatusCode]){
        if([self isResponseDataSafeForCaching]){
            [self saveRequestDataToCache:_data];
        }
        [self notifySuccess:_data];
    }else{
        [self checkDataOnCacheAndNotifyDelegateWithCachingStrategy:_requestCachingStrategy.serverErrorStrategy
                                                    andOnCaseError:[NSError OBTEHTTPErrorWithHTTPCode:(int)_response.statusCode]];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    _data = [[NSMutableData alloc] initWithCapacity:2048];
    _response = (NSHTTPURLResponse*)response;
}


- (void)connection:(NSURLConnection *)theConnection didReceiveData:(NSData *)incrementalData {
    [_data appendData:incrementalData];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [self reqLog:[NSString stringWithFormat:@"Request %@ - Request error %@", _url, error] forLogLevel:RequestLogLevelInfo];
    if ([self internetConnectionAvaliable]){
        [self checkDataOnCacheAndNotifyDelegateWithCachingStrategy:_requestCachingStrategy.noInternetStrategy
                                                    andOnCaseError:[NSError OBTErrorWithCode:OBTRequestErrorNoInternet]];
    }else{
        [self checkDataOnCacheAndNotifyDelegateWithCachingStrategy:_requestCachingStrategy.serverErrorStrategy
                                                    andOnCaseError:[NSError OBTErrorWithCode:OBTRequestErrorUnknown]];
    }
}

- (void) cancelRequest{
    [_connection cancel];
}

@end
