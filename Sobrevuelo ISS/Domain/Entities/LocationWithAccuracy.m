//
//  LocationWithAccuracy.h
//  elparking
//
//  Created by Alvaro Hernández Ojeda on 17/8/17.
//  Copyright © 2017 El Parking Internet S.L. All rights reserved.
//

#import "LocationWithAccuracy.h"

@implementation LocationWithAccuracy

- (id)initWithLocation:(Location *)location andAccuracy:(NSNumber *)accuracy {
    self = [super init];
    if (self) {
        _location = location;
        _accuracy = accuracy;
    }
    return self;
}

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![other isKindOfClass:[self class]])
        return NO;
    return [self isEqualToLocationWithAccuracy:other];
}

- (BOOL)isEqualToLocationWithAccuracy:(LocationWithAccuracy *)aLocationWithAccuracy {
    if (self == aLocationWithAccuracy) {
        return YES;
    }

    if ([self.location isEqual:aLocationWithAccuracy.location] && [self.accuracy isEqual:aLocationWithAccuracy.accuracy]) {
        return YES;
    }
    return NO;
}

- (NSUInteger)hash {
    return [self.location hash] + [self.accuracy hash];
}

@end
