//
//  JSONParser.h
//  OBTRequest
//
//  Created by Cristina Folgueral Gutiérrez on 22/4/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONParserSpec.h"

typedef enum{
    JSONParserLogLevelNone,
    JSONParserLogLevelInfo
}JSONParserLogLevel;

@interface JSONParser : NSObject{
    id <JSONParserSpec> _spec;
    id _parsedJSON;
}

+ (void) setLogLevel:(JSONParserLogLevel) logLevel;

- (id) parseString:(NSString *) string withSpec:(id<JSONParserSpec>) spec;

@end
