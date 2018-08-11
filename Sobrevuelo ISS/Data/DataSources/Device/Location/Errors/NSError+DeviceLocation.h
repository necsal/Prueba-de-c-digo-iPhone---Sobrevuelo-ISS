//
//  NSError+DeviceLocation.h
//  ParkingDoor
//
//  Created by Carlos Jiménez Pacho on 4/5/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DeviceLocationErrors.h"

@interface NSError (DeviceLocation)
+ (NSError *) deviceLocationErrorWithCode:(DeviceLocationErrorCode) errorCode;
+ (NSError *) convertToDeviceLocationFromLocationLibraryWrapper:(NSError *) locationLibraryWrapperError;

@end
