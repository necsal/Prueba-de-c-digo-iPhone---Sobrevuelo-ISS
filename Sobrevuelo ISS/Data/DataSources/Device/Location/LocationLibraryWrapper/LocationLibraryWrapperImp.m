//
//  LocationLibraryWrapper.m
//  ParkingDoor
//
//  Created by Carlos Jiménez Pacho on 4/5/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#import "LocationLibraryWrapperImp.h"
#import <INTULocationManager/INTULocationManager.h>
#import "LocationLibraryWrapperErrors.h"
#import "Transformer.h"

@interface LocationLibraryWrapperImp () {
    id<LocationLibraryWrapperCallback> _callback;
}

@end

@implementation LocationLibraryWrapperImp

- (void)currentLocationWithCallback:(id<LocationLibraryWrapperCallback>)callback {
    _callback = callback;
    [self currentLocation];
}

- (void)currentLocation {

    INTULocationManager *locMgr = [INTULocationManager sharedInstance];

    [locMgr
        requestLocationWithDesiredAccuracy:INTULocationAccuracyNeighborhood
                                   timeout:3.0
                      delayUntilAuthorized:YES
                                     block:^(CLLocation *currentLocation, INTULocationAccuracy achievedAccuracy, INTULocationStatus status) {

                                       if (status == INTULocationStatusSuccess) {
                                           Location *location = [Transformer convertFromCLLocation:currentLocation];
                                           [_callback locationLibraryWrapperObtained:location];
                                       } else if (status == INTULocationStatusTimedOut) {
                                           NSError *error = [NSError errorWithDomain:LocationLibraryWrapperErrorDomain code:LocationLibraryWrapperErrorLocationUnavailable userInfo:nil];
                                           [_callback locationLibraryWrapperError:error];
                                       } else {
                                           if (status == INTULocationStatusServicesDenied || status == INTULocationStatusServicesDisabled) {
                                               [_callback
                                                   locationLibraryWrapperError:[NSError errorWithDomain:LocationLibraryWrapperErrorDomain code:LocationLibraryWrapperErrorLocationDenied userInfo:nil]];
                                           } else {
                                               NSError *error = [NSError errorWithDomain:LocationLibraryWrapperErrorDomain code:LocationLibraryWrapperErrorUnknown userInfo:nil];
                                               [_callback locationLibraryWrapperError:error];
                                           }
                                       }
                                     }];
}

@end
