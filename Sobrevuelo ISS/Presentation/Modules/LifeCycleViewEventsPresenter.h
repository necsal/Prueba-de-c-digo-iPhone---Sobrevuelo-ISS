//
//  LifeCycleViewEventsPresenter.h
//  elparking
//
//  Created by Carlos Jiménez Pacho on 29/2/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#ifndef LifeCycleViewEventsPresenter_h
#define LifeCycleViewEventsPresenter_h

#endif /* LifeCycleViewEventsPresenter_h */

@protocol LifeCycleViewEventsPresenter <NSObject>
- (void)viewDidLoad;
- (void)viewWillAppear;
- (void)viewWillDisappear;
- (void)viewDidAppear;
- (void)viewDidDisappear;
@end