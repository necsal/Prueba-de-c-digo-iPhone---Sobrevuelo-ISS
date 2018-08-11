//
//  UIViewController+WaitView.h
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 29/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (WaitView)

- (void) showWaitView;
- (void) showWAitViewOnView:(UIView*)view;
- (void) hideWaitView;

@end
