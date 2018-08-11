//
//  RequestVODelegate.h
//  Zierta
//
//  Created by Cristina Folgueral Gutiérrez on 12/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONObjectSpec.h"

typedef enum{
    JSONPSExpectedResponseObject,
    JSONPSExpectedResponseArray
}JSONPSExpectedResponse;


@protocol JSONParserSpec <NSObject>

- (JSONPSExpectedResponse) expectedResponseType;
- (id<JSONObjectSpec>) responseObjectSpec;

@end
