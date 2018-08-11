//
//  MainPresenterImp.h
//  elparking
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "BasePresenter.h"
#import "MainPresenter.h"
#import "OverflightsUseCase.h"
#import "DeviceLocation.h"

@interface MainPresenterImp : BasePresenter <MainPresenter>

- (instancetype)initWithOverflightsUseCase:(id<OverflightsUseCase>)overflightsUseCase
                            deviceLocation:(id<DeviceLocation>)deviceLocation
                           errorTranslater:(id<ErrorTranslater>)errorTranslater
                               messageView:(id<MessageView>)messageView;

@end
