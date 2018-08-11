//
//  UIViewController+WaitView.m
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 29/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#import "UIViewController+WaitView.h"
#import "SpinWaitView.h"
#import <objc/message.h>
#import "NSLayoutConstraint+SimpleFormatLanguage.h"

static NSString *const VIEW_KEY = @"wait_view_key";

@implementation UIViewController (WaitView)

- (void)showWAitViewOnView:(UIView *)view {
    SpinWaitView *waitView = objc_getAssociatedObject(self, &VIEW_KEY);
    if (waitView) {
        return;
    }

    waitView = [[SpinWaitView alloc] init];
    [view addSubview:waitView];
    waitView.alpha = 0;
    [UIView animateWithDuration:0.15
                     animations:^() {
                       waitView.alpha = 1;
                     }];
    waitView.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *constraints =
        [NSLayoutConstraint constraintsWithSimpleFormat:@[ [NSString stringWithFormat:@"view.centerX = waitView.centerX"], [NSString stringWithFormat:@"view.centerY = waitView.centerY"] ]
                                                metrics:nil
                                                  views:NSDictionaryOfVariableBindings(view, waitView)];
    [view addConstraints:constraints];

    objc_setAssociatedObject(self, &VIEW_KEY, waitView, OBJC_ASSOCIATION_ASSIGN);
}
- (void)showWaitView {
    [self showWAitViewOnView:self.view.window];
}

- (void)hideWaitView {
    SpinWaitView *waitView = objc_getAssociatedObject(self, &VIEW_KEY);
    if (waitView) {
        [waitView removeFromSuperview];
        objc_setAssociatedObject(self, &VIEW_KEY, nil, OBJC_ASSOCIATION_ASSIGN);
    }
}

@end
