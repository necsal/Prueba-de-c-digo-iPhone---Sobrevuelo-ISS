
//
//  NSError+Repository.m
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 23/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#import "NSError+DataSource.h"
#import "NSError+Repository.h"

@implementation NSError (Repository)

+ (NSError *)repositoryErrorWithCode:(RepositoryErrorCode)errorCode {
    return [self repositoryErrorWithCode:errorCode userInfo:nil];
}

+ (NSError *)repositoryErrorWithCode:(RepositoryErrorCode)errorCode userInfo:(NSDictionary *)userInfo {
    return [NSError errorWithDomain:RepositoryErrorDomain code:errorCode userInfo:userInfo];
}

+ (NSError *)convertToRepositoryFromDataSourceError:(NSError *)dataSourceError {
    NSError *error = nil;
    error = [NSError repositoryErrorWithCode:RepositoryErrorUnknown];

    return error;
}

@end
