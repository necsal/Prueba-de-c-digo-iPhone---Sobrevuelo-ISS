//
//  LocationViewModel.h
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 11/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location.h"

@interface LocationViewModel : NSObject

- (instancetype)initWithLocation:(Location *)location;

@property(readonly, nonatomic) NSString *locationString;

@end
