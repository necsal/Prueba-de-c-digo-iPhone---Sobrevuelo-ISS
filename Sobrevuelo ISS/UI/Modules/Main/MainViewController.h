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

    __weak IBOutlet UILabel *_lblDuration1;
    __weak IBOutlet UILabel *_lblRisetime1;
    __weak IBOutlet UILabel *_lblDuration2;
    __weak IBOutlet UILabel *_lblRisetime2;
    __weak IBOutlet UILabel *_lblDuration3;
    __weak IBOutlet UILabel *_lblRisetime3;
    __weak IBOutlet UILabel *_lblDuration4;
    __weak IBOutlet UILabel *_lblRisetime4;
    __weak IBOutlet UILabel *_lblDuration5;
    __weak IBOutlet UILabel *_lblRisetime5;
}

- (instancetype)initWithPresenter:(id<MainPresenter>)presenter;

@end
