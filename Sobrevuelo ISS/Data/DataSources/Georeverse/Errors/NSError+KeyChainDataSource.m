//
//  NSError+GeoreverseDataSource.m
//  elparking
//
//  Created by Alvaro Hernández Ojeda on 11/7/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#import "NSError+GeoreverseDataSource.h"

@implementation NSError (GeoreverseDataSource)
+ (NSError *)georeverseDataSourceErrorWithCode:(GeoreverseDataSourceErrorCode)errorCode {
    return [NSError errorWithDomain:GeoreverseDataSourceErrorDomain code:errorCode userInfo:nil];
}
@end
