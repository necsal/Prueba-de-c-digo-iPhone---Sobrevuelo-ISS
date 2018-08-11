//
//  BaseViewController.m
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 30/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#import "BaseViewController.h"
#import "UIViewController+ModalWaitView.h"
#import "UIViewController+WaitView.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.barTintColor = [UIColor grayColor];
    [self setDefaultFormatForNavigationControllerTitle];
}

- (void)setDefaultFormatForNavigationControllerTitle {
    self.navigationController.navigationBar.titleTextAttributes =
        @{NSForegroundColorAttributeName : [UIColor blackColor], NSFontAttributeName : [UIFont systemFontOfSize:16.0f weight:UIFontWeightLight]};
}

- (void)setDefaultFormatForNavigationControllerTitleWithDarkContent {
    self.navigationController.navigationBar.titleTextAttributes =
        @{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize:16.0f weight:UIFontWeightLight]};
}

- (void)setBackgroundWhiteColor {
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - Setup navbar

- (UIButton *)createButtonWithImage:(NSString *)imagename withTitle:(NSString *)title andEdgeInsets:(UIEdgeInsets)insets {
    UIImage *img = [UIImage imageNamed:imagename];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIFont *font = [UIFont systemFontOfSize:12];

    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    CGSize textSize = [[[NSAttributedString alloc] initWithString:title attributes:attributes] size];
    if ([title length])
        btn.frame = CGRectMake(0, 0, textSize.width + insets.left + insets.right, img.size.height + insets.top + insets.bottom);
    else
        btn.frame = CGRectMake(0, 0, img.size.width, img.size.height);
    [btn setTitle:title forState:UIControlStateNormal];
    btn.contentEdgeInsets = insets;
    btn.backgroundColor = [UIColor clearColor];

    [btn.titleLabel setFont:font];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imagename] forState:UIControlStateNormal];

    return btn;
}

- (UIBarButtonItem *)menuButton {
    UIButton *menuButton = [self createButtonWithImage:@"menu.png" withTitle:@"" andEdgeInsets:UIEdgeInsetsZero];
    [menuButton addTarget:self action:@selector(tapOnMenuButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barbuttonItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
    barbuttonItem.accessibilityLabel = @"Menú";
    barbuttonItem.isAccessibilityElement = YES;
    return barbuttonItem;
}

- (UIBarButtonItem *)backButton {
    UIButton *menuButton = [self createButtonWithImage:@"back_arrow_black.png" withTitle:@"" andEdgeInsets:UIEdgeInsetsZero];
    [menuButton addTarget:self action:@selector(tapOnBackButton) forControlEvents:UIControlEventTouchUpInside];

    NSInteger width = menuButton.imageView.image.size.width > 44 ? menuButton.imageView.image.size.width : 44;
    NSInteger height = menuButton.imageView.image.size.height > 44 ? menuButton.imageView.image.size.height : 44;
    menuButton.frame = CGRectMake(0, 0, width, height);
    menuButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;

    UIBarButtonItem *barbuttonItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
    barbuttonItem.accessibilityLabel = @"Atrás";
    barbuttonItem.isAccessibilityElement = YES;
    return barbuttonItem;
}

- (UIBarButtonItem *)backButtonWhite {
    UIButton *menuButton = [self createButtonWithImage:@"back_arrow.png" withTitle:@"" andEdgeInsets:UIEdgeInsetsZero];
    [menuButton addTarget:self action:@selector(tapOnBackButton) forControlEvents:UIControlEventTouchUpInside];

    NSInteger width = menuButton.imageView.image.size.width > 44 ? menuButton.imageView.image.size.width : 44;
    NSInteger height = menuButton.imageView.image.size.height > 44 ? menuButton.imageView.image.size.height : 44;
    menuButton.frame = CGRectMake(0, 0, width, height);
    menuButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;

    UIBarButtonItem *barbuttonItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
    barbuttonItem.accessibilityLabel = @"Atrás";
    barbuttonItem.isAccessibilityElement = YES;
    return barbuttonItem;
}

- (UIBarButtonItem *)addButton {
    UIButton *addButton = [self createButtonWithImage:@"icon_add.png" withTitle:@"" andEdgeInsets:UIEdgeInsetsZero];
    [addButton addTarget:self action:@selector(tapOnAddButton) forControlEvents:UIControlEventTouchUpInside];
    addButton.accessibilityLabel = @"Añadir";
    addButton.isAccessibilityElement = YES;
    return [[UIBarButtonItem alloc] initWithCustomView:addButton];
}

- (UIBarButtonItem *)addButtonWhite {
    UIButton *addButton = [self createButtonWithImage:@"add_buttom.png" withTitle:@"" andEdgeInsets:UIEdgeInsetsZero];
    [addButton addTarget:self action:@selector(tapOnAddButton) forControlEvents:UIControlEventTouchUpInside];
    addButton.accessibilityLabel = @"Añadir";
    addButton.isAccessibilityElement = YES;
    return [[UIBarButtonItem alloc] initWithCustomView:addButton];
}

- (UIBarButtonItem *)closeButtonMainColor {
    return [self closeButton:@"close_icon"];
}

- (UIBarButtonItem *)closeButtonWhite {
    return [self closeButton:@"close"];
}

- (UIBarButtonItem *)closeButtonBlack {
    return [self closeButton:@"close_icon_black"];
}

- (UIBarButtonItem *)closeButton:(NSString *)color {
    UIButton *closeButton = [self createButtonWithImage:color withTitle:@"" andEdgeInsets:UIEdgeInsetsZero];
    [closeButton addTarget:self action:@selector(tapOnCloseButton) forControlEvents:UIControlEventTouchUpInside];
    closeButton.accessibilityLabel = @"Cerrar";
    closeButton.isAccessibilityElement = YES;

    NSInteger width = closeButton.imageView.image.size.width > 44 ? closeButton.imageView.image.size.width : 44;
    NSInteger height = closeButton.imageView.image.size.height > 44 ? closeButton.imageView.image.size.height : 44;
    closeButton.frame = CGRectMake(0, 0, width, height);
    closeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;

    return [[UIBarButtonItem alloc] initWithCustomView:closeButton];
}

- (UIBarButtonItem *)searchButton {
    UIButton *searchButton = [self createButtonWithImage:@"icon_search_navbar.png" withTitle:@"" andEdgeInsets:UIEdgeInsetsZero];
    [searchButton addTarget:self action:@selector(tapOnSearchButton) forControlEvents:UIControlEventTouchUpInside];
    searchButton.accessibilityLabel = @"Cerrar";
    searchButton.isAccessibilityElement = YES;
    return [[UIBarButtonItem alloc] initWithCustomView:searchButton];
}

- (void)setupNavbar:(NavBarType)navBarType withTitle:(NSString *)title {

    self.title = title;

    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;

    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];

    switch (navBarType) {
    case NavBarBack: {
        self.navigationItem.leftBarButtonItem = [self backButton];
        self.navigationItem.rightBarButtonItem = nil;
        self.navigationController.navigationBar.translucent = NO;
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
        [self setDefaultFormatForNavigationControllerTitle];
        break;
    }
    case NavBarElparkingMainColor: {
        self.navigationItem.leftBarButtonItem = [self backButtonWhite];
        self.navigationController.navigationBar.translucent = YES;
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
        [self setDefaultFormatForNavigationControllerTitleWithDarkContent];
        break;
    }
    case NavBarElparkingTraslucentBgWhite: {
        self.navigationItem.leftBarButtonItem = [self backButton];
        self.navigationController.navigationBar.translucent = YES;
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
        [self setDefaultFormatForNavigationControllerTitle];
        break;
    }
    case NavBarElparkingTraslucentBgWhiteCloseBlack: {
        [self.navigationItem setHidesBackButton:YES];
        self.navigationItem.rightBarButtonItem = [self closeButtonBlack];
        self.navigationController.navigationBar.translucent = YES;
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
        break;
    }
    case NavBarElparkingTraslucentBgDark: {
        self.navigationItem.leftBarButtonItem = [self backButtonWhite];
        self.navigationController.navigationBar.translucent = YES;
        [self setDefaultFormatForNavigationControllerTitleWithDarkContent];
        break;
    }

    case NavBarElparkingMainColorWithClose: {
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.rightBarButtonItem = [self closeButtonWhite];
        self.navigationController.navigationBar.translucent = YES;
        self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
        break;
    }

    case NavBarElparkingMainColorWithAddButton: {
        self.navigationItem.leftBarButtonItem = [self backButtonWhite];
        self.navigationItem.rightBarButtonItem = [self addButtonWhite];
        self.navigationController.navigationBar.translucent = YES;
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
        break;
    }
    case NavBarElparkingGrayColor: {
        self.navigationItem.leftBarButtonItem = [self backButton];
        self.navigationController.navigationBar.translucent = NO;
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
        break;
    }
    case NavBarElparkingGrayColorWithAddButton: {
        self.navigationItem.leftBarButtonItem = [self backButton];
        self.navigationItem.rightBarButtonItem = [self addButton];
        self.navigationController.navigationBar.translucent = NO;
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
        break;
    }
    case NavBarElparkingGrayColorWithSearchButton: {
        self.navigationItem.leftBarButtonItem = [self backButton];
        self.navigationItem.rightBarButtonItem = [self searchButton];
        self.navigationController.navigationBar.translucent = NO;
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
        break;
    }
    case NavBarEmpty: {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
        break;
    }
    case NavBarElparkingMainColorEmpty: {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
        break;
    }
    case NavBarClose: {
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.rightBarButtonItem = [self closeButtonMainColor];
        self.navigationController.navigationBar.translucent = NO;
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
        break;
    }
    case NavBarCloseBlack: {
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.rightBarButtonItem = [self closeButtonBlack];
        self.navigationController.navigationBar.translucent = NO;
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
        break;
    }
    case NavBarBackCloseBlack: {
        self.navigationItem.leftBarButtonItem = [self backButton];
        self.navigationItem.rightBarButtonItem = [self closeButtonBlack];
        self.navigationController.navigationBar.translucent = NO;
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
        break;
    }
    case NavBarHiddenWithLightStatusBar: {
        [self.navigationController setNavigationBarHidden:YES animated:NO];
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
        break;
    }
    case NavBarHiddenWithDarkStatusBar: {
        [self.navigationController setNavigationBarHidden:YES animated:NO];
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
        break;
    }
    case NavBarBgWhiteColorBack: {
        self.navigationItem.leftBarButtonItem = [self backButton];
        self.navigationItem.rightBarButtonItem = nil;
        self.navigationController.navigationBar.translucent = NO;
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
        [self setBackgroundWhiteColor];
        break;
    }
    case NavBarBgWhiteColorWithAddButton: {
        self.navigationItem.leftBarButtonItem = [self backButton];
        self.navigationItem.rightBarButtonItem = [self addButton];
        self.navigationController.navigationBar.translucent = NO;
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
        [self setBackgroundWhiteColor];
        break;
    }
    case NavBarElparkingMainColorWithShadowImage: {
        self.navigationItem.leftBarButtonItem = [self backButtonWhite];
        self.navigationController.navigationBar.translucent = NO;
        UIImage *image = [[UIImage imageNamed:@"background_degradierten"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) resizingMode:UIImageResizingModeStretch];
        [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
        self.navigationController.navigationBar.titleTextAttributes =
            @{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize:17.0f weight:UIFontWeightRegular]};
        break;
    }
    default:
        break;
    }
}

- (void)configureNavBarMenuTitle {
    self.navigationItem.leftBarButtonItem = [self menuButton];
}

#pragma mark - Actions nav buttons

- (void)tapOnMenuButton {
    [self.view endEditing:YES];
}

- (void)tapOnBackButton {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)tapOnAddButton {
    return;
}

- (void)tapOnEdit {
    return;
}

- (void)tapOnCloseButton {
    return;
}

- (void)tapOnSearchButton {
    return;
}

- (void)dealloc {
    [self clearScreenOnDisappear];
}

- (void)clearScreenOnDisappear {
    [self hideWaitView];
    [self hideModalWaitView];
}

@end
