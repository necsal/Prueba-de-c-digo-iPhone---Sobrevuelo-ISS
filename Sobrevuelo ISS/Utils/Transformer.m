//
//  Transformer.m
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 18/8/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#import "Transformer.h"

@implementation Transformer

+ (Location *) convertFromCLLocation:(CLLocation *) CLLocation{
    if(CLLocation){
        Location *location = [[Location alloc]initWithLatitude:[NSNumber numberWithFloat:CLLocation.coordinate.latitude]
                                                  andLongitude:[NSNumber numberWithFloat:CLLocation.coordinate.longitude]];
        return location;
    }
    return nil;
}

@end
