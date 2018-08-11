//
//  NSError+OBTError.m
//  OBTRequest
//
//  Created by Cristina Folgueral Gutiérrez on 23/4/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#import "NSError+OBTRequest.h"

@implementation NSError (OBTRequest)

+ (NSError *) OBTErrorWithCode:(OBTRequestErrorCode) errorCode{
    return [NSError errorWithDomain:OBTRequestErrorDomain
                               code:errorCode
                           userInfo:nil];
}

+ (NSError *) OBTEHTTPErrorWithHTTPCode:(int) httpErrorCode{
    return [NSError errorWithDomain:OBTRequestErrorDomain
                               code:OBTRequestErrorHTTP
                           userInfo:@{
                                      OBTRequestHTTPCodeKey:
                                          [NSNumber numberWithInteger:httpErrorCode]
                                      }];
}

@end
