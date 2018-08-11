//
//  OverflightsUseCase.h
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#ifndef OverflightsUseCase_h
#define OverflightsUseCase_h

#endif /* OverflightsUseCase_h */

@protocol OverflightsCallback <NSObject>

- (void)overflightsOk:(NSArray *)overflights;
- (void)overflightsError:(NSError *)error;

@end

@protocol OverflightsUseCase <NSObject>

- (void)executeWithLatitude:(NSNumber *)latitude longitude:(NSNumber *)longitude andCallback:(id<OverflightsCallback>)callback;

@end
