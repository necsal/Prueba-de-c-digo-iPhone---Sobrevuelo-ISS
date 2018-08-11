//
//  UIViewController+ModalWaitView.h
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 29/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ModalWaitView)

- (void)showModalWaitView;
- (void)showModalWaitViewOnView:(UIView *)view;
- (void)hideModalWaitView;

@end
