//
//  UIViewController+ModalWaitView.m
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 29/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#import "UIViewController+ModalWaitView.h"
#import "ModalWaitView.h"
#import <objc/message.h>
#import "NSLayoutConstraint+SimpleFormatLanguage.h"

static float const MODAL_VIEW_TOP = 0.0;
static float const MODAL_VIEW_LEFT = 0.0;
static float const MODAL_VIEW_RIGHT = 0.0;
static float const MODAL_VIEW_BOTTOM = 0.0;

static NSString *const MODAL_VIEW_KEY = @"modal_view_key";

@implementation UIViewController (ModalWaitView)

- (void)showModalWaitViewOnView:(UIView *)view {
    ModalWaitView *modalWaitView = objc_getAssociatedObject(self, &MODAL_VIEW_KEY);
    if (modalWaitView) {
        return;
    }

    modalWaitView = [[ModalWaitView alloc] init];
    [view addSubview:modalWaitView];
    modalWaitView.alpha = 0;
    [UIView animateWithDuration:0.15
                     animations:^() {
                       modalWaitView.alpha = 1;
                     }];

    modalWaitView.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *constraints = [NSLayoutConstraint constraintsWithSimpleFormat:@[
        [NSString stringWithFormat:@"modalWaitView.top = view.top + %f", MODAL_VIEW_TOP],
        [NSString stringWithFormat:@"modalWaitView.left = view.left + %f", MODAL_VIEW_LEFT],
        [NSString stringWithFormat:@"modalWaitView.bottom = view.bottom + %f", MODAL_VIEW_BOTTOM],
        [NSString stringWithFormat:@"modalWaitView.right = view.right + %f", MODAL_VIEW_RIGHT]
    ] metrics:nil views:NSDictionaryOfVariableBindings(modalWaitView, view)];
    [view addConstraints:constraints];

    [view setNeedsLayout];
    [view layoutIfNeeded];
    objc_setAssociatedObject(self, &MODAL_VIEW_KEY, modalWaitView, OBJC_ASSOCIATION_ASSIGN);
}

- (void)showModalWaitView {
    [self showModalWaitViewOnView:self.view.window];
}

- (void)hideModalWaitView {
    ModalWaitView *modalWaitView = objc_getAssociatedObject(self, &MODAL_VIEW_KEY);
    if (modalWaitView) {
        [modalWaitView removeFromSuperview];
        objc_setAssociatedObject(self, &MODAL_VIEW_KEY, nil, OBJC_ASSOCIATION_ASSIGN);
    }
}

@end
