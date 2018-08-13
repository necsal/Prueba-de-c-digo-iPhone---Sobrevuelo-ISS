//
//  LocationViewModel.h
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 11/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "LocationViewModel.h"
#import "ServiceLocator.h"

@interface LocationViewModel () {
    Location *_location;
}

@end

@implementation LocationViewModel
- (instancetype)initWithLocation:(Location *)location {
    self = [super init];
    if (self) {
        _location = location;
        [self fillData];
    }
    return self;
}

- (void)fillData {
    _locationString = [NSString stringWithFormat:@"%@, %@", _location.latitude, _location.longitude];
}

@end
