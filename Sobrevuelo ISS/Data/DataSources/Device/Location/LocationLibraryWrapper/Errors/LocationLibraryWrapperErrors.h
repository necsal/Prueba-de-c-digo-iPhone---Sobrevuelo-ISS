//
//  LocationLibraryWrapperErrors.h
//  ParkingDoor
//
//  Created by Carlos Jiménez Pacho on 4/5/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#ifndef ParkingDoor_LocationLibraryWrapperErrors_h
#define ParkingDoor_LocationLibraryWrapperErrors_h

#define LocationLibraryWrapperErrorDomain @"LocationLibraryWrapper"

typedef enum{
    LocationLibraryWrapperErrorLocationUnavailable=1000,
    LocationLibraryWrapperErrorLocationDenied,
    LocationLibraryWrapperErrorUnknown
}LocationLibraryWrapperErrorCode;

#endif
