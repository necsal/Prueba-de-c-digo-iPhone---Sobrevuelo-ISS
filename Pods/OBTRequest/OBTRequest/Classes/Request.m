#import "Request.h"
#import <CFNetwork/CFNetwork.h>
#import "Reachability.h"
#import "CacheManager.h"

#define BASE_URL @"%@/%@" // estará compuesto del host (server) y de la acción de API. La acción de la API se saca de sobreescribir el método service

static bool kMockedResponse = false;
static RequestLogLevel reqLogLevel;
static const float REQUEST_TIMEOUT = 40.0;
@implementation Request

- (id) initWithServer:(NSString*)server {
    self = [super init];
    if (self) {
        _server = server;
    }
    return self;
}

- (id) body {
    NSAssert(false, @"Método para sobreescribir");
	return nil;
}

- (OrderedDictionary*) parameters {
    NSAssert(false, @"Método para sobreescribir");
	return nil;
}

- (NSDictionary*) headers{
    NSAssert(false, @"Método para sobreescribir");
    return nil;
}

- (NSString*) service {
    NSAssert(false, @"Método para sobreescribir");
	return nil;
}

- (NSString*) mockedJSONResponse {
    NSAssert(false, @"Método para sobreescribir");
	return nil;
}

- (RequestHTTPMethod) method{
    NSAssert(false, @"Método para sobreescribir");
    return RequestHTTPMethodGET;
}

- (BOOL) isResponseDataSafeForCaching{
    NSAssert(false, @"Método para sobreescribir");
    return NO;
}

+ (void) setLogLevel:(RequestLogLevel) logLevel{
    reqLogLevel = logLevel;
}

- (void) reqLog:(NSString *) log forLogLevel:(RequestLogLevel) level{
    if(level <= reqLogLevel){
       NSLog(@"%@",log);      
    }
}

- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace {
    return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust])
        if ([challenge.protectionSpace.host rangeOfString:@"obture"].location != NSNotFound)
            [challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
    [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}


#pragma mark check reachabiblity

- (BOOL) internetConnectionAvaliable{
	Reachability *rea = [Reachability reachabilityForInternetConnection];
    return [rea isReachable];
}

#pragma mark -

- (BOOL) isMockActive{
    return kMockedResponse && [self mockedJSONResponse];
}


- (BOOL) isValidHTTPStatusCode{
    return _response.statusCode < 400;
}

- (NSData *) getMockedOrCachedDataForCatchingStrategy:(id<CachingStrategy>) cachingStrategy{
    if([self isMockActive])
        return [[self mockedJSONResponse] dataUsingEncoding:NSUTF8StringEncoding];
    else
        return [self dataForCachingStrategy:cachingStrategy];
}

#pragma mark -

- (void) invalidateCache{
    [self composeUrl];
    [[CacheManager defaultManager] removeCacheByName:[_url absoluteString]];
}

- (void) saveRequestDataToCache:(NSData *) data{
    [[CacheManager defaultManager] saveData:data withName:[_url absoluteString]];
}

- (NSData *) dataForCachingStrategy:(id<CachingStrategy>) cachingStrategy{
    return [[CacheManager defaultManager] getCachedDataWithName:[_url absoluteString] andCachingStrategy:cachingStrategy];
}

- (void) composeUrl{
    NSDictionary *params = [self parameters];
    NSMutableString *str = [[NSMutableString alloc] init];
    [str appendFormat:BASE_URL, _server, [self service]];
    int params_cnt = 0;
    if (params != nil && [params count] > 0) {
        for (id k in params) {
            params_cnt++;
            if(params_cnt==1)
                [str appendFormat:@"?%@=%@", k, [params objectForKey:k]];
            else
                [str appendFormat:@"&%@=%@", k, [params objectForKey:k]];
        }
    }
    _url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
}

- (void) composeURLRequest{
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:_url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:REQUEST_TIMEOUT];
    id body = [self body];

    NSString *method = @"GET";
    if([self method] == RequestHTTPMethodGET){
        method = @"GET";
    }else if ([self method] == RequestHTTPMethodPOST){
        method = @"POST";
    }else if ([self method] == RequestHTTPMethodPUT){
        method = @"PUT";
    }else if ([self method] == RequestHTTPMethodDELETE){
        method = @"DELETE";
    }
    [req setHTTPMethod:method];
    [req setAllHTTPHeaderFields:[self headers]];
    
    [self reqLog:[NSString stringWithFormat:@"Request %@ - Headers -> %@",_url,[req allHTTPHeaderFields]] forLogLevel:RequestLogLevelInfo];
    
    if (body != nil) {
        NSAssert([body isKindOfClass:[NSData class]] || [body isKindOfClass:[NSString class]], @"Body must be NSData or NSString");
        [self reqLog:[NSString stringWithFormat:@"Request %@ - Body %@",_url,body] forLogLevel:RequestLogLevelInfo];
        NSData *bodyData = nil;

        if([body isKindOfClass:[NSData class]])
            bodyData = body;
        else
            bodyData = [body dataUsingEncoding:NSUTF8StringEncoding];
        [req setHTTPBody:bodyData];
    }
    _request = req;
}

@end
