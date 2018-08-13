//
//  MainViewController.m
//  elparking
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "MainViewController.h"
#import "UIViewController+ModalWaitView.h"
#import "TimerCountDownView.h"
#import "NSLayoutConstraint+SimpleFormatLanguage.h"

@interface MainViewController () <TimerCountDownViewDelegate> {
    id<MainPresenter> _presenter;
}

@end

@implementation MainViewController

- (instancetype)initWithPresenter:(id<MainPresenter>)presenter {
    self = [super init];
    if (self) {
        _presenter = presenter;
        [_presenter attachView:self];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavbar:NavBarBack withTitle:@"Localización ISS"];
    [_presenter viewDidLoad];

    [self setupView];
}

- (void)setupView {
    NSString *urlAddress = @"http://necsal.es/ISS_location/iss_location.html";
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:requestObj];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)showWaitForTask {
    [self showModalWaitViewOnView:self.view];
}
- (void)hideWaitForTask {
    [self hideModalWaitView];
}

- (void)refreshOverflightsWithOverflightViewModel:(OverflightViewModel *)overflightViewModel {
    _lblRisetime.text = overflightViewModel.risetime;
    [self setupCountDownWithCountDownDate:overflightViewModel.duration];
}
- (void)setupCountDownWithCountDownDate:(NSTimeInterval)countDownDate {
    TimerCountDownView *countDownTimerLabel = [[TimerCountDownView alloc] init];
    countDownTimerLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_viewContainerTimerCountDown addSubview:countDownTimerLabel];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithSimpleFormat:@[
                   @"_viewContainerTimerCountDown.top = countDownTimerLabel.top", @"_viewContainerTimerCountDown.left = countDownTimerLabel.left",
                   @"_viewContainerTimerCountDown.right = countDownTimerLabel.right", @"_viewContainerTimerCountDown.bottom = countDownTimerLabel.bottom"
               ]
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(countDownTimerLabel, _viewContainerTimerCountDown)]];

    countDownTimerLabel.delegate = self;
    countDownTimerLabel.fontSize = 15;
    countDownTimerLabel.color = [UIColor blackColor];
    countDownTimerLabel.textAlignment = NSTextAlignmentLeft;
    [countDownTimerLabel startWithCountDownDate:countDownDate];
}
- (void)countDownReachZero {
    NSLog(@"Se acabó el tiempo !!!");
}

- (void)refreshLocation:(LocationViewModel *)locationViewModel {
    _lblLocation.text = locationViewModel.locationString;
}

- (void)refreshAddress:(NSString *)address {
    _lblAddress.text = address;
}

@end
