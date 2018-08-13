//
//  APIDataSource.h
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Overflight.h"

@protocol APIDataSource <NSObject>

- (NSArray *)getOverflightsWithLatitude:(NSNumber *)latitude longitude:(NSNumber *)longitude error:(NSError **)error;
- (Overflight *)getNextOverflightWithLatitude:(NSNumber *)latitude longitude:(NSNumber *)longitude error:(NSError **)error;

@end
