//
//  NSError+GeoreverseDataSource.h
//  elparking
//
//  Created by Alvaro Hernández Ojeda on 11/7/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#import "GeoreverseDataSourceErrors.h"
#import <Foundation/Foundation.h>

@interface NSError (GeoreverseDataSource)
+ (NSError *)georeverseDataSourceErrorWithCode:(GeoreverseDataSourceErrorCode)errorCode;

@end
