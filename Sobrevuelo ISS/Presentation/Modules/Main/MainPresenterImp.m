//
//  MainPresenterImp.m
//  elparking
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "MainPresenterImp.h"

@interface MainPresenterImp () <OverflightsCallback, DeviceLocationCallback> {
    __weak id<MainView> _view;
    id<OverflightsUseCase> _overflightsUseCase;
    id<DeviceLocation> _deviceLocation;
    Location *_location;
}

@end

@implementation MainPresenterImp

- (instancetype)initWithOverflightsUseCase:(id<OverflightsUseCase>)overflightsUseCase
                            deviceLocation:(id<DeviceLocation>)deviceLocation
                           errorTranslater:(id<ErrorTranslater>)errorTranslater
                               messageView:(id<MessageView>)messageView {
    self = [super init];
    if (self) {
        _overflightsUseCase = overflightsUseCase;
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
    [self getOverflights];
}
- (void)currentLocationError:(NSError *)error {
    [_view hideWaitForTask];
    [self handleError:error];
}

- (void)getOverflights {
    [_overflightsUseCase executeWithLatitude:_location.latitude longitude:_location.longitude andCallback:self];
}

- (void)overflightsOk:(NSArray *)overflights {
    [_view hideWaitForTask];
    NSArray *overflightsViewModel = [self getOverflightsViewModelWithOverflights:overflights];
    [_view refreshOverflightsWithOverflightsViewModel:overflightsViewModel];
}
- (NSArray *)getOverflightsViewModelWithOverflights:(NSArray *)overflights {
    NSMutableArray *overflightsViewModel = [[NSMutableArray alloc] init];
    for (Overflight *overflight in overflights) {
        OverflightViewModel *overflightViewModel = [[OverflightViewModel alloc] initWithOverflight:overflight];
        [overflightsViewModel addObject:overflightViewModel];
    }
    return overflightsViewModel;
}
- (void)overflightsError:(NSError *)error {
    [_view hideWaitForTask];

    [self handleError:error];
}

@end
