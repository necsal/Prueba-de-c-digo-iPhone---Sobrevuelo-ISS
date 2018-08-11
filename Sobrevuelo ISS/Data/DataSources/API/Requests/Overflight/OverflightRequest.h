//
//  OverflightRequest.h
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "RequestSynchronous.h"

@interface OverflightRequest : RequestSynchronous

- (instancetype)initWithLatitude:(NSNumber *)latitude andLongitude:(NSNumber *)longitude;

@end
