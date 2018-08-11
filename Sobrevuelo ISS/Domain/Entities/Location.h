//
//  Location.h
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 30/4/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject

@property(nonatomic, readonly) NSNumber *latitude;
@property(nonatomic, readonly) NSNumber *longitude;

- (id)initWithLatitude:(NSNumber *)latitude andLongitude:(NSNumber *)longitude;

@end
