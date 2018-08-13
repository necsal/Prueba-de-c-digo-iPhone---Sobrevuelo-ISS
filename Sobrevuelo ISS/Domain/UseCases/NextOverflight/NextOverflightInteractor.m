//
//  NextOverflightInteractor.m
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "NextOverflightInteractor.h"
#import "BaseInteractor+Protected.h"
#import "NSError+BaseInteractor.h"
#import "NSError+Repository.h"

@interface NextOverflightInteractor () {
    id<OverflightsRepository> _overflightsRepository;
    __weak id<NextOverflightCallback> _callback;

    NSNumber *_latitude;
    NSNumber *_longitude;
}

@end

@implementation NextOverflightInteractor

- (instancetype)initWithOverflightsRepository:(id<OverflightsRepository>)overflightsRepository mainThread:(id<MainThread>)mainThread executor:(id<Executor>)executor {
    self = [super initWithMainThread:mainThread andExecutor:executor];
    if (self) {
        _overflightsRepository = overflightsRepository;
    }
    return self;
}

- (void)executeWithLatitude:(NSNumber *)latitude longitude:(NSNumber *)longitude andCallback:(id<NextOverflightCallback>)callback {
    _latitude = latitude;
    _longitude = longitude;
    _callback = callback;
    [self runOnBackground];
}

- (void)run {
    NSError *error = nil;
    Overflight *overflight = [_overflightsRepository getNextOverflightWithLatitude:_latitude longitude:_longitude error:&error];

    if (error) {
        [self notifyError:error];
    } else {
        [self notifyOkToCallback:overflight];
    }
}

- (void)notifyError:(NSError *)repositoryError {
    NSError *domainError = nil;

    domainError = [NSError convertToInteractorErrorFromRepositoryError:repositoryError];
    [self.mainThread post:^{
      [_callback nextOverflightError:domainError];
    }];
}

- (void)notifyOkToCallback:(Overflight *)overflight {
    [_mainThread post:^{
      [_callback nextOverflightOk:overflight];
    }];
}

@end
