//
//  ServiceLocator.m
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "ServiceLocator.h"
#import "ErrorTranslater.h"
#import "ErrorTranslaterImp.h"
#import "MessageView.h"
#import "MessageViewImp.h"
#import "MainThreadImpl.h"
#import "BackgrondExecutor.h"
#import "APIDataSourceImp.h"
#import "MainPresenter.h"
#import "MainPresenterImp.h"
#import "NextOverflightUseCase.h"
#import "NextOverflightInteractor.h"
#import "OverflightsUseCase.h"
#import "OverflightsInteractor.h"
#import "OverflightsRepository.h"
#import "OverflightsRepositoryImp.h"
#import "DeviceLocation.h"
#import "DeviceLocationImp.h"
#import "DateFormaterImp.h"
#import "GeoreverseUseCase.h"
#import "GeoreverseInteractor.h"
#import "GeoreverseDataSource.h"
#import "GeoreverseDataSourceImp.h"
#import "TimeFormaterImp.h"

@implementation ServiceLocator

+ (id<ErrorTranslater>)provideErrorTranslater {
    return [[ErrorTranslaterImp alloc] init];
}

+ (id<MessageView>)provideMessageView {
    return [[MessageViewImp alloc] init];
}

+ (id<MainThread>)provideMainThread {
    return [[MainThreadImpl alloc] init];
}

+ (id<Executor>)provideExecutor {
    return [[BackgrondExecutor alloc] init];
}

+ (UIViewController *)provideVisibleViewController {
    UIViewController *rootController = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [self visibleViewController:rootController];
}

+ (UIViewController *)visibleViewController:(UIViewController *)rootViewController {

    if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UIViewController *lastObject = [((UINavigationController *)rootViewController).viewControllers lastObject];
        if (lastObject.presentedViewController) {
            return [self visibleViewController:lastObject.presentedViewController];
        } else {
            return lastObject;
        }
    } else {
        if (rootViewController.presentedViewController) {
            return [self visibleViewController:rootViewController.presentedViewController];
        } else {
            return rootViewController;
        }
    }
}

+ (id<APIDataSource>)provideAPIDataSource {
    return [[APIDataSourceImp alloc] init];
}

+ (MainViewController *)provideMainViewController {
    return [[MainViewController alloc] initWithPresenter:[self provideMainPresenter]];
}

+ (id<MainPresenter>)provideMainPresenter {
    return [[MainPresenterImp alloc] initWithNextOverflightUseCase:[self provideNextOverflightUseCase]
                                                 georeverseUseCase:[self provideGeoreverseUseCase]
                                                    deviceLocation:[self provideDeviceLocation]
                                                   errorTranslater:[self provideErrorTranslater]
                                                       messageView:[self provideMessageView]];
}

+ (id<GeoreverseUseCase>)provideGeoreverseUseCase {
    return [[GeoreverseInteractor alloc] initWithGeoreverseDataSource:[self provideGeoreverseDataSource] mainThread:[self provideMainThread] executor:[self provideExecutor]];
}
+ (id<GeoreverseDataSource>)provideGeoreverseDataSource {
    return [[GeoreverseDataSourceImp alloc] init];
}

+ (id<NextOverflightUseCase>)provideNextOverflightUseCase {
    return [[NextOverflightInteractor alloc] initWithOverflightsRepository:[self provideOverflightsRepository] mainThread:[self provideMainThread] executor:[self provideExecutor]];
}
+ (id<OverflightsUseCase>)provideOverflightsUseCase {
    return [[OverflightsInteractor alloc] initWithOverflightsRepository:[self provideOverflightsRepository] mainThread:[self provideMainThread] executor:[self provideExecutor]];
}

+ (id<OverflightsRepository>)provideOverflightsRepository {
    return [[OverflightsRepositoryImp alloc] initWithAPIDataSource:[self provideAPIDataSource] overflightValidator:[self provideOverflightValidator]];
}

+ (OverflightValidator *)provideOverflightValidator {
    return [[OverflightValidator alloc] initWithValidator:[self provideValidator]];
}

+ (Validator *)provideValidator {
    return [[Validator alloc] init];
}

+ (id<DeviceLocation>)provideDeviceLocation {
    return [[DeviceLocationImp alloc] init];
}

+ (id<DateFormater>)provideDateFormater {
    return [[DateFormaterImp alloc] init];
}

+ (id<TimeFormater>)provideTimeFormater {
    return [[TimeFormaterImp alloc] init];
}

@end
