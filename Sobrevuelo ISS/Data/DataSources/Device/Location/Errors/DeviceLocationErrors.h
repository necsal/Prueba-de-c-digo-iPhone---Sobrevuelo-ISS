//
//  DeviceLocationErrors.h
//  ParkingDoor
//
//  Created by Carlos Jiménez Pacho on 4/5/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#ifndef ParkingDoor_DeviceLocationErrors_h
#define ParkingDoor_DeviceLocationErrors_h

#define DeviceLocationErrorDomain @"DeviceLocation"


typedef enum{
    DeviceLocationErrorUnavailable=1000,
    DeviceLocationErrorDenied,
    DeviceLocationErrorUnknown,
    
}DeviceLocationErrorCode;

#endif
