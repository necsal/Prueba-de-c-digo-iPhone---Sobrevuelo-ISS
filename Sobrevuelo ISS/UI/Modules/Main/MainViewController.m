//
//  MainViewController.m
//  elparking
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "MainViewController.h"
#import "UIViewController+ModalWaitView.h"

@interface MainViewController () {
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
    _lblDuration.text = overflightViewModel.duration;
    _lblRisetime.text = overflightViewModel.risetime;
}

- (void)refreshLocation:(LocationViewModel *)locationViewModel {
    _lblLocation.text = locationViewModel.locationString;
}

- (void)refreshAddress:(NSString *)address {
    _lblAddress.text = address;
}

@end
