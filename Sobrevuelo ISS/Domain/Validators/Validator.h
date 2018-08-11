//
//  Validator.h
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 28/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validator : NSObject {
}
- (BOOL)isBoolean:(NSNumber *)number;
- (BOOL)isStringEmpty:(NSString *)string;
- (BOOL)isIntPositiveNumber:(NSNumber *)number;
- (BOOL)isTimeInterval:(NSNumber *)number;
- (BOOL)isFloatNumber:(NSNumber *)number;
- (BOOL)isEmailValid:(NSString *)candidate;
- (BOOL)isInt:(int)candidate inRangeMin:(int)min max:(int)max;
- (BOOL)isArray:(id)array;
- (BOOL)isDateLaterThanNow:(NSDate *)date withMargin:(int)minutes;
- (BOOL)isDate:(NSDate *)date1 previousToDate:(NSDate *)date2;
- (BOOL)isDateDayLaterThanNow:(NSDate *)date;
- (BOOL)isDateDayLaterThanNowWihtoutTime:(NSDate *)date;
- (BOOL)isMinLength:(NSString *)string length:(int)length;
- (BOOL)isNumberNotNil:(NSNumber *)number;
- (BOOL)isUrlValid:(NSString *)url;
- (BOOL)isPhoneValid:(NSString *)phone;
@end
