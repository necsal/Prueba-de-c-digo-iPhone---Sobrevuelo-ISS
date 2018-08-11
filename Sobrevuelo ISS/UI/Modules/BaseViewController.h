//
//  BaseViewController.h
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 30/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    NavBarBack,
    NavBarEmpty,
    NavBarClose,
    NavBarCloseBlack,
    NavBarBackCloseBlack,
    NavBarElparkingMainColorEmpty,
    NavBarElparkingMainColor,
    NavBarElparkingTraslucentBgWhite,
    NavBarElparkingTraslucentBgWhiteCloseBlack,
    NavBarElparkingMainColorWithClose,
    NavBarElparkingMainColorWithAddButton,
    NavBarElparkingGrayColor,
    NavBarElparkingGrayColorWithAddButton,
    NavBarElparkingGrayColorWithSearchButton,
    NavBarElparkingTraslucentBgDark,
    NavBarHiddenWithLightStatusBar,
    NavBarHiddenWithDarkStatusBar,
    NavBarBgWhiteColorBack,
    NavBarBgWhiteColorWithAddButton,
    NavBarElparkingMainColorWithShadowImage
} NavBarType;

@interface BaseViewController : UIViewController {
}

- (void)setupNavbar:(NavBarType)navBarType withTitle:(NSString *)title;

@property(retain, nonatomic) NSString *titleAnalytics;

@end
