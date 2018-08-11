//
//  MainThread.m
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 13/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#import "MainThreadImpl.h"

@implementation MainThreadImpl

- (void) post:(main_thread_block_t) blockToMainThread{
    dispatch_async(dispatch_get_main_queue(), blockToMainThread);
}
@end
