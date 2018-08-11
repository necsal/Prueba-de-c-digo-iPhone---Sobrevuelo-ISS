//
//  NSError+DataSource.h
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "DataSourceErrors.h"
#import <Foundation/Foundation.h>

typedef enum {
    RequestErrorScopeGeneric
} RequestErrorScope;

@interface NSError (DataSource)

+ (NSError *)dataSourceErrorWithCode:(DataSourceErrorCode)errorCode;

+ (NSError *)convertToDataSourceFromRequestError:(NSError *)requestError requestErrorScope:(RequestErrorScope)requestErrorScope errorData:(NSData *)errorData;

@end
