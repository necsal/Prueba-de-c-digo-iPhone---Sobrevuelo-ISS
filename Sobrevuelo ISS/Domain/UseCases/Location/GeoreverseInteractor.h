//
//  GeoreverseInteractor.h
//  elparking
//
//  Created by Alvaro Hernández Ojeda on 30/6/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#import "BaseInteractor.h"
#import "GeoreverseUseCase.h"
#import "GeoreverseDataSource.h"

@interface GeoreverseInteractor : BaseInteractor <GeoreverseUseCase>

- (instancetype)initWithGeoreverseDataSource:(id<GeoreverseDataSource>)georeverseDataSource mainThread:(id<MainThread>)mainThread executor:(id<Executor>)executor;

@end
