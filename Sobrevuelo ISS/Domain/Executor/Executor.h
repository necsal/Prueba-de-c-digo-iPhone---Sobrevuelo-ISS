//
//  Executor.h
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 13/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#ifndef ParkingDoor_Executor_h
#define ParkingDoor_Executor_h
#import "Interactor.h"

@protocol Executor <NSObject>
- (void) run:(id<Interactor>) interactor;
- (void) runTask:(void(^)(void)) taskBlock;
@end



#endif
