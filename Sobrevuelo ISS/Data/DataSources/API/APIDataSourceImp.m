//
//  APIDataSourceImp.m
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "APIDataSourceImp.h"
#import "NSError+DataSource.h"
#import "NSError+OBTRequest.h"
#import "JSONParser.h"
#import "OverflightRequest.h"
#import "OverflightsParse.h"

@implementation APIDataSourceImp

- (NSArray *)getOverflightsWithLatitude:(NSNumber *)latitude longitude:(NSNumber *)longitude error:(NSError **)error {

    OverflightRequest *req = [[OverflightRequest alloc] initWithLatitude:latitude andLongitude:longitude];
    NSError *responseError = nil;
    NSData *responseData = [req executeWithRequestCachingStrategy:nil error:&responseError];
    return [self processOverflightResponseData:responseData withResponseError:responseError error:error];
}
- (NSArray *)processOverflightResponseData:(NSData *)responseData withResponseError:(NSError *)responseError error:(NSError **)error {
    NSArray *overflights = nil;

    if (responseError) {
        if (error) {
            *error = [NSError convertToDataSourceFromRequestError:responseError requestErrorScope:RequestErrorScopeGeneric errorData:responseData];
        }
    } else {
        NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        overflights = [self parseOverflight:responseString];
    }

    return overflights;
}
- (NSArray *)parseOverflight:(NSString *)overflightString {
    OverflightsParse *overflightsParse = [[OverflightsParse alloc] init];
    return [overflightsParse parseOverflights:overflightString];
}

@end
