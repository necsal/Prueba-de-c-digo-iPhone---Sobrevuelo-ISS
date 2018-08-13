//
//  TimeFormaterImp.m
//  elparking
//
//  Created by Alvaro Hernández Ojeda on 10/2/17.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#import "TimeFormaterImp.h"
#import "ServiceLocator.h"

@interface TimeFormaterImp () {
}

@end

@implementation TimeFormaterImp

- (NSString *)timeFromSeconds:(NSNumber *)seconds {
    NSUInteger h = [seconds intValue] / 3600;
    NSUInteger m = ([seconds intValue] / 60) % 60;
    NSUInteger s = [seconds intValue] % 60;

    NSMutableString *time = [[NSMutableString alloc] init];
    if (h > 0) {
        [time appendString:[NSString stringWithFormat:@"%u hora ", h]];
    }
    if (m > 0) {
        [time appendString:[NSString stringWithFormat:@"%u min ", m]];
    }
    if (s > 0) {
        [time appendString:[NSString stringWithFormat:@"%u seg", s]];
    }

    return time;
}

@end
