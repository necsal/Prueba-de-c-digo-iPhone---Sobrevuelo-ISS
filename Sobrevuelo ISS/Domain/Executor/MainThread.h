//
//  MainThread.h
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 13/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#ifndef ParkingDoor_MainThread_h
#define ParkingDoor_MainThread_h

typedef void (^main_thread_block_t)(void);

@protocol MainThread <NSObject>
- (void) post:(main_thread_block_t) blockToMainThread;
@end

#endif
