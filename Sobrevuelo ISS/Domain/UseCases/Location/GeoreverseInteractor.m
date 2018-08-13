//
//  GeoreverseInteractor.m
//  elparking
//
//  Created by Alvaro Hernández Ojeda on 30/6/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#import "GeoreverseInteractor.h"
#import "BaseInteractor+Protected.h"
#import "NSError+GeoreverseDataSource.h"

@interface GeoreverseInteractor () <GeoreverseDataSourceCallback> {
    __weak id<GeoreverseCallback> _callback;
    id<GeoreverseDataSource> _georeverseDataSource;
    Location *_location;
}

@end

@implementation GeoreverseInteractor

- (instancetype)initWithGeoreverseDataSource:(id<GeoreverseDataSource>)georeverseDataSource mainThread:(id<MainThread>)mainThread executor:(id<Executor>)executor {
    self = [super initWithMainThread:mainThread andExecutor:executor];
    if (self) {
        _georeverseDataSource = georeverseDataSource;
    }
    return self;
}

- (void)executeWithLocation:(Location *)location andGeoreverseCallback:(id<GeoreverseCallback>)callback {
    _location = location;
    _callback = callback;
    [self runOnBackground];
}

- (void)run {
    [_mainThread post:^{
        [_georeverseDataSource addressFromLocation:_location withCallback:self];
    }];
}

- (void)georeverseDataSourceOk:(NSString *)address {
    [_mainThread post:^{
        [_callback georeverseOk:address];
    }];
}
- (void)georeverseDataSourceError:(NSError *)error {
    error = [NSError convertToInteractorErrorFromGeoreverseError:error];
    [_mainThread post:^{
        [_callback georeverseError:error];
    }];
}

@end
