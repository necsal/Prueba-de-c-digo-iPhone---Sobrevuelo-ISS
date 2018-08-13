//
//  MainPresenterImp.m
//  elparking
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "MainPresenterImp.h"

@interface MainPresenterImp () <NextOverflightCallback, DeviceLocationCallback, GeoreverseCallback> {
    __weak id<MainView> _view;
    id<NextOverflightUseCase> _nextOverflightUseCase;
    id<GeoreverseUseCase> _georeverseUseCase;
    id<DeviceLocation> _deviceLocation;
    Location *_location;
}

@end

@implementation MainPresenterImp

- (instancetype)initWithNextOverflightUseCase:(id<NextOverflightUseCase>)nextOverflightUseCase
                            georeverseUseCase:(id<GeoreverseUseCase>)georeverseUseCase
                               deviceLocation:(id<DeviceLocation>)deviceLocation
                              errorTranslater:(id<ErrorTranslater>)errorTranslater
                                  messageView:(id<MessageView>)messageView {
    self = [super init];
    if (self) {
        _nextOverflightUseCase = nextOverflightUseCase;
        _georeverseUseCase = georeverseUseCase;
        _deviceLocation = deviceLocation;
        _errorTranslater = errorTranslater;
        _messageView = messageView;
    }
    return self;
}

- (void)attachView:(id<MainView>)view {
    _view = view;
}

- (void)viewDidLoad {
    [self getDeviceLocation];
}
- (void)viewWillAppear {
}
- (void)viewWillDisappear {
}
- (void)viewDidAppear {
}
- (void)viewDidDisappear {
}

- (void)getDeviceLocation {
    [_view showWaitForTask];
    [_deviceLocation currentLocationWithCallback:self];
}
- (void)currentLocationOk:(Location *)location {
    _location = location;
    LocationViewModel *locationVM = [[LocationViewModel alloc] initWithLocation:location];
    [_view refreshLocation:locationVM];
    [self getGeoreverse];
    [self getNextOverflight];
}
- (void)currentLocationError:(NSError *)error {
    [_view hideWaitForTask];
    [self handleError:error];
}

- (void)getGeoreverse {
    [_georeverseUseCase executeWithLocation:_location andGeoreverseCallback:self];
}
- (void)georeverseOk:(NSString *)address {
    [_view refreshAddress:address];
}
- (void)georeverseError:(NSError *)error {
}

- (void)getNextOverflight {
    [_nextOverflightUseCase executeWithLatitude:_location.latitude longitude:_location.longitude andCallback:self];
}
- (void)nextOverflightOk:(Overflight *)overflight {
    [_view hideWaitForTask];
    OverflightViewModel *overflightViewModel = [[OverflightViewModel alloc] initWithOverflight:overflight];
    [_view refreshOverflightsWithOverflightViewModel:overflightViewModel];
}
- (void)nextOverflightError:(NSError *)error {
    [_view hideWaitForTask];
    [self handleError:error];
}

@end
