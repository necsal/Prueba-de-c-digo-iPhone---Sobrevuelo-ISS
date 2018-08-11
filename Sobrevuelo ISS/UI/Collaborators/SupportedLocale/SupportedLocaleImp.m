//
//  SupportedLocaleImp.m
//  elparking
//
//  Created by Alvaro Hernández Ojeda on 15/6/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#import "SupportedLocaleImp.h"

@implementation SupportedLocaleImp

- (NSString *)getSupportedLocale {

    NSArray *localizationsSupportedArray = [[NSBundle mainBundle] localizations];
    NSString *currentLocale = [[NSLocale currentLocale] localeIdentifier];
    currentLocale = [currentLocale substringToIndex:2];

    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF == %@", currentLocale];
    NSArray *filteredArray = [localizationsSupportedArray filteredArrayUsingPredicate:predicate];

    if ([filteredArray count]) {
        return [filteredArray objectAtIndex:0];
    } else {
        return @"es";
    }
}

- (NSString *)getDeviceLanguage {
    return [[NSLocale preferredLanguages] objectAtIndex:0];
}

@end
