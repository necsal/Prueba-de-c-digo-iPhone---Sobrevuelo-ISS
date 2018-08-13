//
//  OverflightViewModel.h
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "OverflightViewModel.h"
#import "ServiceLocator.h"

@interface OverflightViewModel () {
    Overflight *_overflight;
}

@end

@implementation OverflightViewModel
- (instancetype)initWithOverflight:(Overflight *)overflight {
    self = [super init];
    if (self) {
        _overflight = overflight;
        [self fillData];
    }
    return self;
}

- (void)fillData {
    _duration = [self getDuration];
    _risetime = [[ServiceLocator provideDateFormater] dateFromTimestamp:[_overflight.risetime doubleValue]];
}

- (NSTimeInterval)getDuration {
    NSDate *mydate = [NSDate date];
    NSDate *dateEightHoursAhead = [mydate dateByAddingTimeInterval:[_overflight.duration doubleValue]];
    return [dateEightHoursAhead timeIntervalSince1970];
}

@end
