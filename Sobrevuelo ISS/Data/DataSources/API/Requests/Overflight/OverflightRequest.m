//
//  OverflightRequest.h
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "OverflightRequest.h"
#import "APIServerInfo.h"
#import "Request+Autenticated.h"
#import "Request+Gzip.h"
#import "Request+AppInfo.h"
#import "LoaderMockedResponse.h"

@interface OverflightRequest () {
    NSNumber *_latitude;
    NSNumber *_longitude;
}

@end

@implementation OverflightRequest

- (instancetype)initWithLatitude:(NSNumber *)latitude andLongitude:(NSNumber *)longitude {
    self = [super initWithServer:@"http://api.open-notify.org"];
    if (self) {
        _latitude = latitude;
        _longitude = longitude;
    }
    return self;
}

- (NSString *)body {
    return nil;
}

- (OrderedDictionary *)parameters {
    return nil;
}

- (NSDictionary *)headers {
    NSDictionary *dictionaryHeaders = [self dicctionaryWithAutorizationHeaderFromDictionary:HEADER_JSON withUser:@"" andPassword:nil];
    dictionaryHeaders = [self gzipHttpHeaderFromDictionary:dictionaryHeaders];
    dictionaryHeaders = [self dicctionaryWithAppInfoFromDictionary:dictionaryHeaders];

    return dictionaryHeaders;
}

- (NSString *)service {
    return [NSString stringWithFormat:@"iss-pass.json?lat=%@&lon=%@", _latitude, _longitude];
}

- (NSString *)mockedJSONResponse {
    return nil;
}

- (RequestHTTPMethod)method {
    return RequestHTTPMethodGET;
}

- (BOOL)isResponseDataSafeForCaching {
    return NO;
}

@end
