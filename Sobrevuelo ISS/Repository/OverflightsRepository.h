//
//  OverflightsRepository.h
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#ifndef OverflightsRepository_h
#define OverflightsRepository_h

#endif /* OverflightsRepository_h */

@protocol OverflightsRepository <NSObject>

- (NSArray *)getOverflightsWithLatitude:(NSNumber *)latitude longitude:(NSNumber *)longitude error:(NSError **)error;

@end
