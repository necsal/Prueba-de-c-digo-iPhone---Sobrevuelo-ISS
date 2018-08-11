//
//  BackgrondExecutor.m
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 13/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//
//  Base class which allows to perform task in bg.
//
//

#import "BackgrondExecutor.h"

@implementation BackgrondExecutor


- (void) run:(id<Interactor>) interactor{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        @autoreleasepool {
            [interactor run];
        }
    });
}

- (void) runTask:(void(^)(void)) taskBlock{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        @autoreleasepool {
            taskBlock();
        }
    });
}

@end
