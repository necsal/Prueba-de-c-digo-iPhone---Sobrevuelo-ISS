//
//  Transformer.h
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 18/8/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location.h"
@import CoreLocation;

@interface Transformer : NSObject

+ (Location *) convertFromCLLocation:(CLLocation *) CLLocation;

@end
