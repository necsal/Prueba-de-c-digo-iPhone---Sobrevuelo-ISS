//
//  NextOverflightUseCase.h
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "Overflight.h"

#ifndef NextOverflightUseCase_h
#define NextOverflightUseCase_h

#endif /* NextOverflightUseCase_h */

@protocol NextOverflightCallback <NSObject>

- (void)nextOverflightOk:(Overflight *)overflight;
- (void)nextOverflightError:(NSError *)error;

@end

@protocol NextOverflightUseCase <NSObject>

- (void)executeWithLatitude:(NSNumber *)latitude longitude:(NSNumber *)longitude andCallback:(id<NextOverflightCallback>)callback;

@end
