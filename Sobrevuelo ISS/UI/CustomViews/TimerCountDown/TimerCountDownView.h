//
//  TimerCountDownView.h
//  elparking
//
//  Created by Carlos Jiménez Pacho on 23/6/17.
//  Copyright © 2017 El Parking Internet S.L. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TimerCountDownViewDelegate <NSObject>
- (void)countDownReachZero;
@end

@interface TimerCountDownView : UIView {

    __weak IBOutlet UILabel *_lblTimerCountDown;
}

- (instancetype)init;
- (void)startWithCountDownDate:(NSTimeInterval)countDownDate;
- (void)startWithStopWatchDate:(NSTimeInterval)stopWatchDate;

@property(nonatomic) float fontSize;
@property(nonatomic) UIColor *color;
@property(nonatomic) NSTextAlignment textAlignment;
@property(nonatomic) BOOL isLargeSeparation;
@property(nonatomic) id<TimerCountDownViewDelegate> delegate;
@end
