//
//  OBTErrorCodes.h
//  OBTRequest
//
//  Created by Cristina Folgueral Gutiérrez on 23/4/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#ifndef OBTRequest_OBTErrorCodes_h
#define OBTRequest_OBTErrorCodes_h

#define OBTRequestErrorDomain @"OBTRequest"

typedef enum{
    OBTRequestErrorHTTP = 1000,
    OBTRequestErrorNoInternet,
    OBTRequestErrorUnknown
}OBTRequestErrorCode;

#define OBTRequestHTTPCodeKey @"OBTRequestHTTPCodeKey"

#endif
