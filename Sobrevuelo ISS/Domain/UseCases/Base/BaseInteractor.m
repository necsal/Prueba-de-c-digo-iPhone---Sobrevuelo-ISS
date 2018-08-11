//
//  BaseInteractor.m
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 13/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#import "BaseInteractor.h"
#import "BackgrondExecutor.h"
#import "NSError+Repository.h"
#import "MainThreadImpl.h"
#import "BaseInteractor+Protected.h"

@implementation BaseInteractor

- (instancetype)initWithMainThread:(id<MainThread>)mainThread andExecutor:(id<Executor>)executor {
    self = [super init];
    if (self) {
        _mainThread = mainThread;
        _executor = executor;
    }
    return self;
}

- (void)run {
    NSAssert(false, @"You must implement run method on your Intector child class");
}

- (void)runOnBackground {
    [_executor run:self];
}

- (void)postBgTask:(bg_task_block)blockToMainThread {
    [_executor runTask:blockToMainThread];
}

- (id<MainThread>)mainThread {
    return _mainThread;
}

@end
