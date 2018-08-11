//
//  NSError+DeviceLocation.m
//  ParkingDoor
//
//  Created by Carlos Jiménez Pacho on 4/5/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#import "NSError+DeviceLocation.h"
#import "LocationLibraryWrapperErrors.h"

@implementation NSError (DeviceLocation)

+ (NSError *) deviceLocationErrorWithCode:(DeviceLocationErrorCode) errorCode{
    return [NSError errorWithDomain:DeviceLocationErrorDomain
                               code:errorCode
                           userInfo:nil];
}

+ (NSError *) convertToDeviceLocationFromLocationLibraryWrapper:(NSError *) locationLibraryWrapperError{
    NSError *error = nil;
    if(locationLibraryWrapperError.code == LocationLibraryWrapperErrorLocationUnavailable)
        error = [NSError deviceLocationErrorWithCode:DeviceLocationErrorUnavailable];
    else if(locationLibraryWrapperError.code == LocationLibraryWrapperErrorLocationDenied)
        error = [NSError deviceLocationErrorWithCode:DeviceLocationErrorDenied];
    else
        error = [NSError deviceLocationErrorWithCode:DeviceLocationErrorUnknown];
    return error;
}

@end
