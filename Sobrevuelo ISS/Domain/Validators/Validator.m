//
//  Validator.m
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 28/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#import "Validator.h"

@implementation Validator

- (BOOL)isBoolean:(NSNumber *)number {
    if ([number intValue] == 0 || [number intValue] == 1)
        return YES;
    else
        return NO;
}

- (BOOL)isStringEmpty:(NSString *)string {
    if ([string isKindOfClass:[NSString class]])
        return [string length] == 0;
    return YES;
}

- (BOOL)isIntPositiveNumber:(NSNumber *)number {

    if (number && [number isKindOfClass:[NSNumber class]] &&
        ((strcmp([number objCType], @encode(int)) == 0) || (strcmp([number objCType], @encode(long)) == 0) || (strcmp([number objCType], @encode(long long)) == 0)))
        return [number intValue] > 0;
    return NO;
}

- (BOOL)isTimeInterval:(NSNumber *)number {
    if (number && [number isKindOfClass:[NSNumber class]]) {
        if ((strcmp([number objCType], @encode(double)) == 0)) {
            return [number doubleValue] > 0;
        }
    }
    return NO;
}

- (BOOL)isFloatNumber:(NSNumber *)number {
    return (number && [number isKindOfClass:[NSNumber class]] && (strcmp([number objCType], @encode(float)) == 0));
}

- (BOOL)isArray:(id)array {
    return [array isKindOfClass:[NSArray class]];
}

- (BOOL)isEmailValid:(NSString *)candidate {
    NSString *emailRegex = @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}" @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
        @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-" @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
        @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
        @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", emailRegex];

    return [emailTest evaluateWithObject:candidate];
}

- (BOOL)isInt:(int)candidate inRangeMin:(int)min max:(int)max {
    return candidate >= min && candidate <= max;
}

- (BOOL)isDateLaterThanNow:(NSDate *)date withMargin:(int)minutes {
    // NSDate *compareDateWithMargin = [date dateByAddingTimeInterval:-60*minutes];

    if ([date compare:[NSDate date]] == NSOrderedAscending)
        return NO;

    return YES;
}

- (BOOL)isDate:(NSDate *)date1 previousToDate:(NSDate *)date2 {
    return ([date1 compare:date2] == NSOrderedAscending);
}

- (BOOL)isDateDayLaterThanNow:(NSDate *)date {
    NSDate *now = [NSDate date];
    int hours = 60 * 60 * 24;
    NSTimeInterval time = floor([now timeIntervalSinceReferenceDate] / hours) * hours;
    now = [NSDate dateWithTimeIntervalSinceReferenceDate:time];
    
    if ([date compare:now] == NSOrderedAscending) {
        return NO;
    }
    
    return YES;
}

- (BOOL)isDateDayLaterThanNowWihtoutTime:(NSDate *)date {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
    NSDate *now = [[NSCalendar currentCalendar] dateFromComponents:components];
    
    if ([date compare:now] == NSOrderedAscending) {
        return NO;
    }
    
    return YES;
}

- (BOOL)isMinLength:(NSString *)string length:(int)length {
    if ([string length] < length) {
        return NO;
    }
    return YES;
}

- (BOOL)isNumberNotNil:(NSNumber *)number {
    return number != nil && ![number isEqual:[NSNull null]];
}

- (BOOL)isUrlValid:(NSString *)url {
    NSString *urlRegEx = @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    return [urlTest evaluateWithObject:url];
}

- (BOOL)isPhoneValid:(NSString *)phone {
    NSString *phoneRegex = @"(\\+[0-9]+[\\- \\.]*)?(\\([0-9]+\\)[\\- \\.]*)?([0-9][0-9\\- \\.]+[0-9])";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", phoneRegex];
    
    return [phoneTest evaluateWithObject:phone];
}

@end
