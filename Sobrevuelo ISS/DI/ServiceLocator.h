//
//  ServiceLocator.h
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "APIDataSource.h"
#import "MainViewController.h"
#import "DateFormater.h"
#import "TimeFormater.h"

@import UIKit;

@interface ServiceLocator : NSObject

+ (UIViewController *)provideVisibleViewController;
+ (id<APIDataSource>)provideAPIDataSource;
+ (MainViewController *)provideMainViewController;
+ (id<DateFormater>)provideDateFormater;
+ (id<TimeFormater>)provideTimeFormater;

@end
