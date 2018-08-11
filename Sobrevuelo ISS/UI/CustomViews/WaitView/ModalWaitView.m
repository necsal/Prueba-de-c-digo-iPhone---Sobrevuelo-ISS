//
//  ModalWaitView.m
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 29/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#import "ModalWaitView.h"
#import "SpinWaitView.h"
#import "NSLayoutConstraint+SimpleFormatLanguage.h"

@interface ModalWaitView () {
}

@end

@implementation ModalWaitView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self prepareView];
    }
    return self;
}

- (void)prepareView {
    self.backgroundColor = [UIColor colorWithRed:222 / 255.0 green:222 / 255.0 blue:222 / 255.0 alpha:0.6];
    [self prepareAndAddWaitView];
}

- (void)prepareAndAddWaitView {
    SpinWaitView *waitView = [[SpinWaitView alloc] init];
    [self addSubview:waitView];

    waitView.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *constraints =
        [NSLayoutConstraint constraintsWithSimpleFormat:@[ [NSString stringWithFormat:@"self.centerX = waitView.centerX"], [NSString stringWithFormat:@"self.centerY = waitView.centerY"] ]
                                                metrics:nil
                                                  views:NSDictionaryOfVariableBindings(waitView, self)];

    [self addConstraints:constraints];
}

@end
