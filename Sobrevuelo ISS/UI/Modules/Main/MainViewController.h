//
//  MainViewController.h
//  elparking
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "BaseViewController.h"
#import "MainPresenter.h"

@interface MainViewController : BaseViewController <MainView> {

    __weak IBOutlet UILabel *_lblTitle;
    __weak IBOutlet UILabel *_lblLocation;
    __weak IBOutlet UILabel *_lblAddress;
    __weak IBOutlet UILabel *_lblRisetime;

    __weak IBOutlet UIView *_viewContainerTimerCountDown;
    
    __weak IBOutlet UIWebView *_webView;
}

- (instancetype)initWithPresenter:(id<MainPresenter>)presenter;

@end
