//
//  NextOverflightInteractor.h
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "BaseInteractor.h"
#import "NextOverflightUseCase.h"
#import "OverflightsRepository.h"

@interface NextOverflightInteractor : BaseInteractor <NextOverflightUseCase>

- (instancetype)initWithOverflightsRepository:(id<OverflightsRepository>)overflightsRepository mainThread:(id<MainThread>)mainThread executor:(id<Executor>)executor;

@end
