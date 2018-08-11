//
//  DeviceLocationImp.m
//  ParkingDoor
//
//  Created by Carlos Jiménez Pacho on 4/5/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#import "DeviceLocationImp.h"
#import "LocationLibraryWrapper.h"
#import "LocationLibraryWrapperImp.h"
#import "NSError+DeviceLocation.h"
#import "Transformer.h"
#import "LocationLibraryWrapperErrors.h"
@import CoreLocation;

@interface DeviceLocationImp () <LocationLibraryWrapperCallback> {
    __weak id<DeviceLocationCallback> _callback;
}

@end

@implementation DeviceLocationImp

- (void)currentLocationWithCallback:(id<DeviceLocationCallback>)callback {
    _callback = callback;
    id<LocationLibraryWrapper> locationWrapper = [[LocationLibraryWrapperImp alloc] init];
    [locationWrapper currentLocationWithCallback:self];
}

- (Location *)lastLocation {
    CLLocation *location = [self getLocation];
    return [Transformer convertFromCLLocation:location];
}

- (LocationWithAccuracy *)lastLocationWithAccuracy {
    CLLocation *clLocation = [self getLocation];
    Location *loccation = [Transformer convertFromCLLocation:clLocation];
    LocationWithAccuracy *locationWithAccuracy = [[LocationWithAccuracy alloc] initWithLocation:loccation andAccuracy:[NSNumber numberWithDouble:clLocation.horizontalAccuracy]];
    return locationWithAccuracy;
}

- (CLLocation *)getLocation {
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [locationManager requestWhenInUseAuthorization];
    }
    return [locationManager location];
}

#pragma mark - Callbacks location wrapper
- (void)locationLibraryWrapperObtained:(Location *)location {
    [_callback currentLocationOk:location];
}

- (void)locationLibraryWrapperError:(NSError *)error {
    if (error.code == LocationLibraryWrapperErrorLocationUnavailable || error.code == LocationLibraryWrapperErrorUnknown) {
        Location *lastlocation = [self lastLocation];
        if (lastlocation) {
            [_callback currentLocationOk:lastlocation];
            return;
        }
    }
    [_callback currentLocationError:[NSError convertToDeviceLocationFromLocationLibraryWrapper:error]];
}

@end
