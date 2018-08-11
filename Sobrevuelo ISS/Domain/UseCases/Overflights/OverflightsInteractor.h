//
//  OverflightsInteractor.h
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "BaseInteractor.h"
#import "OverflightsUseCase.h"
#import "OverflightsRepository.h"

@interface OverflightsInteractor : BaseInteractor <OverflightsUseCase>

- (instancetype)initWithOverflightsRepository:(id<OverflightsRepository>)overflightsRepository mainThread:(id<MainThread>)mainThread executor:(id<Executor>)executor;

@end
