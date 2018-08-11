//
//  OverflightResponseJSONSpec.m
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "OverflightResponseJSONSpec.h"
#import "OverflightJSONParseSpec.h"

@implementation OverflightResponseJSONSpec

- (JSONPSExpectedResponse)expectedResponseType {
    return JSONPSExpectedResponseObject;
}

- (id<JSONObjectSpec>)responseObjectSpec {
    return [[OverflightJSONParseSpec alloc] init];
}

@end
