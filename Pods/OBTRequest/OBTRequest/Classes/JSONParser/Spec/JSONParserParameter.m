//
//  RequestParserParameter.m
//  Zierta
//
//  Created by Cristina Folgueral Gutiérrez on 12/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JSONParserParameter.h"

@implementation JSONParserParameter

- (id) initWithObjectPropertyName:(NSString *) objectPropertyKey JSONKey:(NSString *) JSONKey andParamType:(RequestSupportedParseType) type{
    self = [super init];
    if(self){
        _objectPropertyName = objectPropertyKey;
        _JSONKey = JSONKey;
        _type = type;
    }
    return self;
}

- (id) initWithObjectPropertyName:(NSString *) objectPropertyKey JSONKey:(NSString *) JSONKey andParamTypeOtherObjectWithSpec:(id<JSONObjectSpec>) spec{
    self = [self initWithObjectPropertyName:objectPropertyKey JSONKey:JSONKey andParamType:RequestSupportedParseTypeOtherVO];
    if(self){
        _otherObjectSpec = spec;
    }
    return self;
}

@end
