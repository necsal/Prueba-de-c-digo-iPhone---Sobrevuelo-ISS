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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavbar:NavBarBack withTitle:@"Localización ISS"];
    [_presenter viewDidLoad];
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

- (void)refreshOverflightsWithOverflightsViewModel:(NSArray *)overflightsViewModel {
    OverflightViewModel *overflightViewModel = [overflightsViewModel objectAtIndex:0];
    _lblDuration1.text = overflightViewModel.duration;
    _lblRisetime1.text = overflightViewModel.risetime;
    
    overflightViewModel = [overflightsViewModel objectAtIndex:1];
    _lblDuration2.text = overflightViewModel.duration;
    _lblRisetime2.text = overflightViewModel.risetime;
    
    overflightViewModel = [overflightsViewModel objectAtIndex:2];
    _lblDuration3.text = overflightViewModel.duration;
    _lblRisetime3.text = overflightViewModel.risetime;
    
    overflightViewModel = [overflightsViewModel objectAtIndex:3];
    _lblDuration4.text = overflightViewModel.duration;
    _lblRisetime4.text = overflightViewModel.risetime;
    
    overflightViewModel = [overflightsViewModel objectAtIndex:4];
    _lblDuration5.text = overflightViewModel.duration;
    _lblRisetime5.text = overflightViewModel.risetime;
    
}

@end
