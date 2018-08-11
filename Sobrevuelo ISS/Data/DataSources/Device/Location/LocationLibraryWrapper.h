//
//  LocationLibraryWrapper.h
//  ParkingDoor
//
//  Created by Carlos Jiménez Pacho on 4/5/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#import "Location.h"
#ifndef ParkingDoor_LocationLibraryWrapper_h
#define ParkingDoor_LocationLibraryWrapper_h


@protocol LocationLibraryWrapperCallback <NSObject>
@optional
- (void) locationLibraryWrapperObtained:(Location*)location;
- (void) locationLibraryWrapperError:(NSError*)error;
@end


@protocol LocationLibraryWrapper <NSObject>

- (void) currentLocationWithCallback:(id<LocationLibraryWrapperCallback>)callback;

@end

#endif
