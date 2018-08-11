
//
//  NSError+BaseInteractor.m
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 27/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#import "NSError+BaseInteractor.h"
#import "NSError+DeviceLocation.h"
#import "RepositoryErrors.h"

@implementation NSError (BaseInteractor)

+ (NSError *)domainErrorWithCode:(DomainErrorCode)errorCode {
    return [self domainErrorWithCode:errorCode userInfo:nil];
}

+ (NSError *)domainErrorWithCode:(DomainErrorCode)errorCode userInfo:(NSDictionary *)userInfo {
    return [NSError errorWithDomain:InteractorErrorDomain code:errorCode userInfo:userInfo];
}

+ (NSError *)convertToInteractorErrorFromRepositoryError:(NSError *)repositoryError {
    NSError *domainError = nil;
    
    domainError = [NSError domainErrorWithCode:DomainErrorUnknown];

    return domainError;
}

+ (NSError *)convertToInteractorErrorFromLocationError:(NSError *)locationError {
    NSError *domainError = nil;
    if (locationError.code == DeviceLocationErrorDenied) {
        domainError = [NSError domainErrorWithCode:DomainErrorLocationDenied];
    } else if (locationError.code == DeviceLocationErrorUnavailable) {
        domainError = [NSError domainErrorWithCode:DomainErrorLocationUnavailable];
    } else {
        domainError = [NSError domainErrorWithCode:DomainErrorLocationUnknown];
    }

    return domainError;
}

@end
