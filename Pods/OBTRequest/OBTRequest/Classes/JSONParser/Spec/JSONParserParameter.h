//
//  RequestParserParameter.h
//  Zierta
//
//  Created by Cristina Folgueral Gutiérrez on 12/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONObjectSpec.h"

typedef enum{
    RequestSupportedParseTypeBoolean,
    RequestSupportedParseTypeInt,
    RequestSupportedParseTypeFloat,
    RequestSupportedParseTypeDouble,
    RequestSupportedParseTypeString,
    RequestSupportedParseTypeOtherVO,
}RequestSupportedParseType;

@interface JSONParserParameter : NSObject{
    NSString *_objectPropertyName;
    NSString *_JSONKey;
    RequestSupportedParseType _type;
    id<JSONObjectSpec> _otherObjectSpec;
}

@property (nonatomic, readonly) NSString *objectPropertyName;
@property (nonatomic, readonly) NSString *JSONKey;
@property (nonatomic, readonly) RequestSupportedParseType type;
@property (nonatomic, readonly) id<JSONObjectSpec> otherObjectSpec;

- (id) initWithObjectPropertyName:(NSString *) objectPropertyKey JSONKey:(NSString *) JSONKey andParamType:(RequestSupportedParseType) type;
- (id) initWithObjectPropertyName:(NSString *) objectPropertyKey JSONKey:(NSString *) JSONKey andParamTypeOtherObjectWithSpec:(id<JSONObjectSpec>) spec;


@end
