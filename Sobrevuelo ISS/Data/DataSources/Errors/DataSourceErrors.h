//
//  DataSourceERrors.h
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#ifndef DataSourceErrors_h
#define DataSourceErrors_h

#endif /* DataSourceErrors_h */

#define DataSourceErrorDomain @"DataSource"

static int const HTTP_UNAUTHORIZED = 401;
static int const HTTP_CODE_NOT_FOUND = 404;
static int const HTTP_CODE_FORBIDDEN = 403;
static int const HTTP_CODE_VALIDATION_ERROR = 422;
static int const HTTP_CODE_BLOCKED = 423;
static int const HTTP_CODE_UPDATE_REQUIRED = 426;

typedef enum {
    DataSourceErrorNoInternet = 1000,
    DataSourceErrorUnknown,
    DataSourceErrorUnauthorized
} DataSourceErrorCode;
