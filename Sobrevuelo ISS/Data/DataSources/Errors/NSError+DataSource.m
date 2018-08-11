//
//  NSError+DataSource.m
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "JSONParser.h"
#import "NSError+DataSource.h"
#import "NSError+OBTRequest.h"

@implementation NSError (DataSource)

+ (NSError *)dataSourceErrorWithCode:(DataSourceErrorCode)errorCode {
    return [NSError errorWithDomain:DataSourceErrorDomain code:errorCode userInfo:nil];
}

+ (NSError *)convertToDataSourceFromRequestError:(NSError *)requestError requestErrorScope:(RequestErrorScope)requestErrorScope errorData:(NSData *)errorData {

    NSError *error = [self convertFromRequestErrorScopeGeneric:requestError errorData:errorData];

    return error;
}

+ (NSError *)convertFromRequestErrorScopeGeneric:(NSError *)requestError errorData:(NSData *)errorData {
    NSError *error = nil;
    if (requestError.code == OBTRequestErrorNoInternet) {
        error = [NSError dataSourceErrorWithCode:DataSourceErrorNoInternet];
    } else if (requestError.code == OBTRequestErrorHTTP && [[requestError.userInfo objectForKey:OBTRequestHTTPCodeKey] intValue] == HTTP_UNAUTHORIZED) {
        error = [NSError dataSourceErrorWithCode:DataSourceErrorUnauthorized];
    } else if (requestError.code) {
        error = [NSError dataSourceErrorWithCode:DataSourceErrorUnknown];
    }

    return error;
}

@end
