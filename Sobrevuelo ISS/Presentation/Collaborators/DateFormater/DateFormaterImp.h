//
//  DateFormaterImp.h
//  elparking
//
//  Created by Alvaro Hernández Ojeda on 10/2/17.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DateFormater.h"
#import "SupportedLocale.h"

@interface DateFormaterImp : NSObject <DateFormater>

- (instancetype)initWithSupportedLocale:(id<SupportedLocale>)supportedLocale;

@end
