//
//  MainThread.h
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 13/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainThreadWithNoDispatchAsync.h"

@interface MainThreadImpl : NSObject <MainThread>

@end