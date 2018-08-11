//
//  BaseInteractor.h
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 13/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Interactor.h"
#import "NSError+BaseInteractor.h"
#import "MainThread.h"
#import "Executor.h"

@interface BaseInteractor : NSObject <Interactor> {
    id<MainThread> _mainThread;
    id<Executor> _executor;
}

- (instancetype)initWithMainThread:(id<MainThread>)mainThread andExecutor:(id<Executor>)executor;

@end
