//
//  Location.m
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 30/4/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#import "Location.h"

@implementation Location

- (id)initWithLatitude:(NSNumber *)latitude andLongitude:(NSNumber *)longitude {
    self = [super init];
    if (self) {
        _latitude = latitude;
        _longitude = longitude;
    }
    return self;
}

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![other isKindOfClass:[self class]])
        return NO;
    return [self isEqualToLocation:other];
}

- (BOOL)isEqualToLocation:(Location *)aLocation {
    if (self == aLocation) {
        return YES;
    }

    if ([self.latitude isEqual:aLocation.latitude] && [self.longitude isEqual:aLocation.longitude]) {
        return YES;
    }
    return NO;
}

- (NSUInteger)hash {
    return [self.latitude hash] + [self.longitude hash];
}

- (NSString*)description{
    return [NSString stringWithFormat:@"%f,%f",[_latitude floatValue],[_longitude floatValue]];
}
@end
