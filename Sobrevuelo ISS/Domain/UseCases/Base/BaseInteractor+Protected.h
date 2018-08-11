//
//  BaseInteractor+Protected.h
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 14/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#import "MainThread.h"
#ifndef ParkingDoor_BaseInteractor_Protected_h
#define ParkingDoor_BaseInteractor_Protected_h

typedef void (^bg_task_block)(void);

@interface BaseInteractor (Protected)

@property id<MainThread> mainThread;

- (void)runOnBackground;
- (void)postBgTask:(bg_task_block)blockToMainThread;
@end

#endif
