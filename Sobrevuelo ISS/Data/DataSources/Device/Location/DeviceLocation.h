//
//  DeviceLocation.h
//  ParkingDoor
//
//  Created by Carlos Jiménez Pacho on 4/5/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#import "Location.h"
#import "LocationWithAccuracy.h"
#ifndef ParkingDoor_DeviceLocation_h
#define ParkingDoor_DeviceLocation_h

@protocol DeviceLocationCallback <NSObject>

- (void)currentLocationOk:(Location *)location;
- (void)currentLocationError:(NSError *)error;

@end

@protocol DeviceLocation <NSObject>

- (void)currentLocationWithCallback:(id<DeviceLocationCallback>)callback;
- (Location *)lastLocation;
- (LocationWithAccuracy *)lastLocationWithAccuracy;

@end

#endif
