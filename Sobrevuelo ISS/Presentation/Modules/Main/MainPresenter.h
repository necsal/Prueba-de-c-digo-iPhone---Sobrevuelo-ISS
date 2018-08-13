//
//  MainPresenter.h
//  elparking
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "LifeCycleViewEventsPresenter.h"
#import "WaitForTask.h"
#import "OverflightViewModel.h"
#import "LocationViewModel.h"

#ifndef MainPresenter_h
#define MainPresenter_h

#endif /* MainPresenter_h */

@protocol MainView <WaitForTask>

- (void)refreshOverflightsWithOverflightViewModel:(OverflightViewModel *)overflightViewModel;
- (void)refreshLocation:(LocationViewModel *)locationViewModel;
- (void)refreshAddress:(NSString *)address;

@end

@protocol MainPresenter <LifeCycleViewEventsPresenter>

- (void)attachView:(id<MainView>)view;

@end
