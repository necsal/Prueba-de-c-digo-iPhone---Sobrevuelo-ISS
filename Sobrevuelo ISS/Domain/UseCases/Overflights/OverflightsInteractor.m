//
//  OverflightsInteractor.m
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "OverflightsInteractor.h"
#import "BaseInteractor+Protected.h"
#import "NSError+BaseInteractor.h"
#import "NSError+Repository.h"

@interface OverflightsInteractor () {
    id<OverflightsRepository> _overflightsRepository;
    __weak id<OverflightsCallback> _callback;
    
    NSNumber *_latitude;
    NSNumber *_longitude;
}

@end

@implementation OverflightsInteractor

- (instancetype)initWithOverflightsRepository:(id<OverflightsRepository>)overflightsRepository
                              mainThread:(id<MainThread>)mainThread
                                executor:(id<Executor>)executor {
    self = [super initWithMainThread:mainThread andExecutor:executor];
    if (self) {
        _overflightsRepository = overflightsRepository;
    }
    return self;
}

- (void)executeWithLatitude:(NSNumber *)latitude longitude:(NSNumber *)longitude andCallback:(id<OverflightsCallback>)callback {
    _latitude = latitude;
    _longitude = longitude;
    _callback = callback;
    [self runOnBackground];
}

- (void)run {
    NSError *error = nil;
    NSArray *overflights = [_overflightsRepository getOverflightsWithLatitude:_latitude longitude:_longitude error:&error];

    if (error) {
        [self notifyError:error];
    } else {
        [self notifyOkToCallback:overflights];
    }
}

- (void)notifyError:(NSError *)repositoryError {
    NSError *domainError = nil;

    domainError = [NSError convertToInteractorErrorFromRepositoryError:repositoryError];
    [self.mainThread post:^{
      [_callback overflightsError:domainError];
    }];
}

- (void)notifyOkToCallback:(NSArray *)overflights {
    [_mainThread post:^{
      [_callback overflightsOk:overflights];
    }];
}

@end
