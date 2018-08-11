//
//  NSError+OBTError.h
//  OBTRequest
//
//  Created by Cristina Folgueral Gutiérrez on 23/4/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OBTErrorCodes.h"

@interface NSError (OBTRequest){
    
}

+ (NSError *) OBTErrorWithCode:(OBTRequestErrorCode) errorCode;
+ (NSError *) OBTEHTTPErrorWithHTTPCode:(int) httpErrorCode;


@end
