//
//  Overflight.m
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "Overflight.h"

@implementation Overflight

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![other isKindOfClass:[self class]])
        return NO;
    return [self isEqualToOverflight:other];
}

- (BOOL)isEqualToOverflight:(Overflight *)aOverflight {
    if (self == aOverflight)
        return YES;

    if ([self.duration isEqual:aOverflight.duration] && [self.risetime isEqual:aOverflight.risetime]) {
        return YES;
    }
    return NO;
}

- (NSUInteger)hash {
    return [self.duration hash] + [self.risetime hash];
}

@end
