//
//  OverflightViewModel.h
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Overflight.h"

@interface OverflightViewModel : NSObject

- (instancetype)initWithOverflight:(Overflight *)overflight;

@property(readonly, nonatomic) NSTimeInterval duration;
@property(readonly, nonatomic) NSString *risetime;

@end
