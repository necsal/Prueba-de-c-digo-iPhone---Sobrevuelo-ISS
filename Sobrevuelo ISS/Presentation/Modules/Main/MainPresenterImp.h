//
//  MainPresenterImp.h
//  elparking
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "BasePresenter.h"
#import "MainPresenter.h"
#import "NextOverflightUseCase.h"
#import "GeoreverseUseCase.h"
#import "DeviceLocation.h"

@interface MainPresenterImp : BasePresenter <MainPresenter>

- (instancetype)initWithNextOverflightUseCase:(id<NextOverflightUseCase>)nextOverflightUseCase
                            georeverseUseCase:(id<GeoreverseUseCase>)georeverseUseCase
                               deviceLocation:(id<DeviceLocation>)deviceLocation
                              errorTranslater:(id<ErrorTranslater>)errorTranslater
                                  messageView:(id<MessageView>)messageView;

@end
