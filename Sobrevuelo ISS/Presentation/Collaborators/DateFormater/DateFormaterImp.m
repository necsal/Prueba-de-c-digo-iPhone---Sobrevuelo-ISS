//
//  DateFormaterImp.m
//  elparking
//
//  Created by Alvaro Hernández Ojeda on 10/2/17.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#import "DateFormaterImp.h"
#import "ServiceLocator.h"

@interface DateFormaterImp () {
    id<SupportedLocale> _supportedLocale;
}

@end

@implementation DateFormaterImp

- (instancetype)initWithSupportedLocale:(id<SupportedLocale>)supportedLocale {
    self = [super init];
    if (self) {
        _supportedLocale = supportedLocale;
    }
    return self;
}

- (NSString *)dateFromTimestamp:(double)timestamp {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:[_supportedLocale getSupportedLocale]];
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setTimeZone:[NSTimeZone systemTimeZone]];
    [dateformatter setDateFormat:@"HH:mm dd-MM-yyyy Z"];
    [dateformatter setLocale:locale];
    return [dateformatter stringFromDate:date];
}

@end
