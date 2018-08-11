//
//  WaitView.m
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 29/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#import "SpinWaitView.h"
#import <QuartzCore/QuartzCore.h>
#import "NSLayoutConstraint+SimpleFormatLanguage.h"

static float const VIEW_WIDTH = 100.0;
static float const VIEW_HEIGHT = 100.0;
static int const VIEW_CORNER_RADIUS = 5;

@interface SpinWaitView () {
}
@end

@implementation SpinWaitView

- (id)init {
    self = [super init];
    if (self) {
        [self prepareView];
    }
    return self;
}

- (void)prepareView {
    self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    self.layer.cornerRadius = VIEW_CORNER_RADIUS;

    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *constraints =
        [NSLayoutConstraint constraintsWithSimpleFormat:@[ [NSString stringWithFormat:@"self.width = %f", VIEW_WIDTH], [NSString stringWithFormat:@"self.height = %f", VIEW_HEIGHT] ]
                                                metrics:nil
                                                  views:NSDictionaryOfVariableBindings(self)];

    [self addConstraints:constraints];

    [self createAndAddSpinner];
}

- (void)createAndAddSpinner {
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinner.transform = CGAffineTransformMakeScale(1.5, 1.5);
    [spinner startAnimating];
    [self addSubview:spinner];

    spinner.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *constraints =
        [NSLayoutConstraint constraintsWithSimpleFormat:@[ [NSString stringWithFormat:@"self.centerX = spinner.centerX"], [NSString stringWithFormat:@"self.centerY = spinner.centerY"] ]
                                                metrics:nil
                                                  views:NSDictionaryOfVariableBindings(spinner, self)];
    [self addConstraints:constraints];
}

@end
