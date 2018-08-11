//
//  LocationWithAccuracy.h
//  elparking
//
//  Created by Alvaro Hernández Ojeda on 17/8/17.
//  Copyright © 2017 El Parking Internet S.L. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location.h"

@interface LocationWithAccuracy : NSObject

@property(nonatomic, readonly) Location *location;
@property(nonatomic, readonly) NSNumber *accuracy;

- (id)initWithLocation:(Location *)location andAccuracy:(NSNumber *)accuracy;

@end
