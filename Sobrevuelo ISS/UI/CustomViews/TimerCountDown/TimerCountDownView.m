//
//  TimerCountDownView.m
//  elparking
//
//  Created by Carlos Jiménez Pacho on 23/6/17.
//  Copyright © 2017 El Parking Internet S.L. All rights reserved.
//

#import "TimerCountDownView.h"
#import "MZTimerLabel.h"
#import "NSLayoutConstraint+SimpleFormatLanguage.h"

static float const keyTimerComponentsProportionalSize = 0.7;

@interface TimerCountDownView () <MZTimerLabelDelegate> {
    id<TimerCountDownViewDelegate> _delegate;
    NSTimeInterval _countDownDate;
    MZTimerLabel *_countDownTimerLabel;
    BOOL _isCountDown;
}

@end

@implementation TimerCountDownView

- (instancetype)init {
    self = [super init];
    if (self) {

        UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"TimerCountDownView" owner:self options:nil] firstObject];

        view.translatesAutoresizingMaskIntoConstraints = NO;
        self.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:view];

        [self addConstraints:[NSLayoutConstraint constraintsWithSimpleFormat:@[ @"view.top = self.top", @"view.left = self.left", @"view.right = self.right", @"view.bottom = self.bottom" ]
                                                                     metrics:nil
                                                                       views:NSDictionaryOfVariableBindings(self, view)]];

        _lblTimerCountDown.font = [UIFont systemFontOfSize:20];
        _lblTimerCountDown.textColor = [UIColor blackColor];
        _lblTimerCountDown.textAlignment = NSTextAlignmentLeft;
        _lblTimerCountDown.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        view.backgroundColor = [UIColor clearColor];
    }

    return self;
}

- (void)setFontSize:(float)fontSize {
    _lblTimerCountDown.font = [UIFont systemFontOfSize:fontSize];
}

- (void)setColor:(UIColor *)color {
    _lblTimerCountDown.textColor = color;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment {
    _lblTimerCountDown.textAlignment = textAlignment;
}

- (void)startWithCountDownDate:(NSTimeInterval)countDownDate {
    _isCountDown = YES;
    _countDownDate = countDownDate;
    
    [_countDownTimerLabel pause];
    _countDownTimerLabel = nil;
    _countDownTimerLabel = [[MZTimerLabel alloc] initWithLabel:_lblTimerCountDown andTimerType:MZTimerLabelTypeTimer];
    
    [_countDownTimerLabel setCountDownTime:[self calculateSeconds]];
    [_countDownTimerLabel reset];
    
    _countDownTimerLabel.delegate = self;
    [_countDownTimerLabel start];
}
- (void)startWithStopWatchDate:(NSTimeInterval)stopWatchDate {
    _isCountDown = NO;
    _countDownDate = stopWatchDate;
    
    [_countDownTimerLabel pause];
    _countDownTimerLabel = nil;
    _countDownTimerLabel = [[MZTimerLabel alloc] initWithLabel:_lblTimerCountDown andTimerType:MZTimerLabelTypeStopWatch];
    
    [_countDownTimerLabel reset];
    [_countDownTimerLabel setStopWatchTime:_countDownDate];
    
    _countDownTimerLabel.delegate = self;
    [_countDownTimerLabel start];
}

- (double)calculateSeconds {
    if (_isCountDown) {
        NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
        NSTimeInterval secondsToDueDate = _countDownDate - now;
        return secondsToDueDate;
    } else {
        return _countDownDate;
    }
}

- (NSAttributedString *)timerLabel:(MZTimerLabel *)timerLabel customAttributedTextToDisplayAtTime:(NSTimeInterval)time {
    if ([self needsShowCountDay]) {
        return [self attributedStringWithDayCounterWithTime:time];
    } else {
        return [self attributedStringWithoutDayCounterWithTime:time];
    }
}

- (BOOL)needsShowCountDay {
    if ([self calculateSeconds] >= 60 * 60 * 24) {
        return YES;
    } else {
        return NO;
    }
}

- (NSAttributedString *)attributedStringWithDayCounterWithTime:(NSTimeInterval)time {
    int minutes = ((int)time % 3600) / 60;
    int hours = ((int)time % 86400) / 3600;
    int days = (int)time / 86400;

    NSString *countDownNotFormatted;
    if (_isLargeSeparation) {
        countDownNotFormatted = [NSString stringWithFormat:@"%02dD      %02dH      %02dM", days, hours, minutes];
    } else {
        countDownNotFormatted = [NSString stringWithFormat:@"%02dD %02dH %02dM", days, hours, minutes];
    }

    return [self formatCountDownString:countDownNotFormatted];
}

- (NSAttributedString *)attributedStringWithoutDayCounterWithTime:(NSTimeInterval)time {
    int seconds = (int)time % 60;
    int minutes = ((int)time % 3600) / 60;
    int hours = (int)time / 3600;

    NSString *countDownNotFormatted;
    if (_isLargeSeparation) {
        countDownNotFormatted = [NSString stringWithFormat:@"%02dH      %02dM      %02dS", hours, minutes, seconds];
    } else {
        countDownNotFormatted = [NSString stringWithFormat:@"%02dH %02dM %02dS", hours, minutes, seconds];
    }

    return [self formatCountDownString:countDownNotFormatted];
}

- (NSAttributedString *)formatCountDownString:(NSString *)countDownNotFormatted {
    UIFont *fontForHourAndMKeys = [UIFont systemFontOfSize:_lblTimerCountDown.font.pointSize * keyTimerComponentsProportionalSize weight:UIFontWeightLight];
    NSMutableAttributedString *countDownFormatted = [[NSMutableAttributedString alloc] initWithString:countDownNotFormatted];
    NSRange dayKey = [countDownFormatted.string rangeOfString:@"D"];
    [countDownFormatted addAttribute:NSFontAttributeName value:fontForHourAndMKeys range:dayKey];
    NSRange hourKey = [countDownFormatted.string rangeOfString:@"H"];
    [countDownFormatted addAttribute:NSFontAttributeName value:fontForHourAndMKeys range:hourKey];
    NSRange minuteKey = [countDownFormatted.string rangeOfString:@"M"];
    [countDownFormatted addAttribute:NSFontAttributeName value:fontForHourAndMKeys range:minuteKey];
    NSRange secondKey = [countDownFormatted.string rangeOfString:@"S"];
    [countDownFormatted addAttribute:NSFontAttributeName value:fontForHourAndMKeys range:secondKey];

    return countDownFormatted;
}

- (void)timerLabel:(MZTimerLabel *)timerLabel finshedCountDownTimerWithTime:(NSTimeInterval)countTime {
    [self.delegate countDownReachZero];
}

@end
