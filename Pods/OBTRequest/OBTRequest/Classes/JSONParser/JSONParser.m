//
//  JSONParser.m
//  OBTRequest
//
//  Created by Cristina Folgueral Gutiérrez on 22/4/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#import "JSONParser.h"
#import "ParseException.h"
#import "NotExpectedResponseException.h"
#import "JSONObjectSpec.h"
#import "JSONParserParameter.h"

static JSONParserLogLevel _logLevel;

@implementation JSONParser

+ (void) setLogLevel:(JSONParserLogLevel) logLevel{
    _logLevel = logLevel;
}

- (void) parserLog:(NSString *) log forLogLevel:(JSONParserLogLevel) level{
    if(level <= _logLevel)
        NSLog(@"%@",log);
}

- (id) parseString:(NSString *) string withSpec:(id<JSONParserSpec>) spec{
    _spec = spec;
    _parsedJSON = [self convertFromJSONString:string];
    if([self isExpectedType]){
        return [self doParse:_parsedJSON];
    }else{
        [self parserLog:@"La respuesta no corresponde con la respuesta esperada" forLogLevel:JSONParserLogLevelInfo];
        return nil;
    }
    
}

- (id) convertFromJSONString:(NSString *) JSONString{
    return [self convertFromJSONData:[JSONString dataUsingEncoding:NSUTF8StringEncoding]];
}

- (id) convertFromJSONData:(NSData *) JSONData{
    NSError * error = nil;
    id parsedObject = [NSJSONSerialization JSONObjectWithData:JSONData
                                           options:0
                                             error:&error];
    if(error){
        [self parserLog:[NSString stringWithFormat:@"Error convirtiendo de string a JSON %@", error] forLogLevel:JSONParserLogLevelInfo];
        return nil;
    }else
        return parsedObject;
}

- (BOOL) isExpectedType{
    if([_spec expectedResponseType] == JSONPSExpectedResponseArray)
        return [_parsedJSON isKindOfClass:[NSArray class]];
    else
        return ![_parsedJSON isKindOfClass:[NSArray class]];
}

- (id) doParse:(id) jsonResponse{
    id parsedResult = nil;
    if([_spec expectedResponseType] == JSONPSExpectedResponseArray){
        parsedResult = [self parseArraysOfObjects:jsonResponse withObjectSpec:[_spec responseObjectSpec]];
    }else{
        parsedResult = [self parseObjectFromJSONObject:_parsedJSON withSpec:[_spec responseObjectSpec]];
    }
    return parsedResult;
}

- (id) parseObjectFromJSONObject:(id) JSONObject withSpec:(id<JSONObjectSpec>) spec{
    id  parsedObject = [[[spec objectType] alloc] init];
    NSArray *parseStructure = [spec parseStructure];
    
    for(JSONParserParameter *param in parseStructure){
        if([JSONObject objectForKey:param.JSONKey]){
            if(![[JSONObject objectForKey:param.JSONKey] isKindOfClass:[NSNull class]]){
                id JSONvalue = [JSONObject objectForKey:param.JSONKey];
                id processedValue = nil;
                @try {
                    switch (param.type) {
                        case RequestSupportedParseTypeBoolean:
                            processedValue = [NSNumber numberWithBool:[JSONvalue boolValue]];
                            break;
                        case RequestSupportedParseTypeInt:
                            processedValue = [NSNumber numberWithInt:[JSONvalue intValue]];
                            break;
                        case RequestSupportedParseTypeFloat:
                            processedValue = [NSNumber numberWithFloat:[JSONvalue floatValue]];
                            break;
                        case RequestSupportedParseTypeDouble:
                            processedValue = [NSNumber numberWithDouble:[JSONvalue doubleValue]];
                            break;
                        case RequestSupportedParseTypeString:
                            processedValue = JSONvalue;
                            break;
                        case RequestSupportedParseTypeOtherVO:
                            if([JSONvalue isKindOfClass:[NSArray class]])
                                processedValue = [self parseArraysOfObjects:JSONvalue withObjectSpec:param.otherObjectSpec];
                            else
                                processedValue = [self parseObjectFromJSONObject:JSONvalue withSpec:param.otherObjectSpec];
                            break;
                    }
                    
                    [(NSObject *)parsedObject setValue:processedValue forKey:param.objectPropertyName];
                }
                @catch (NSException *exception) {
                    [self parserLog:[NSString stringWithFormat:@"Parámetro malo! %@",param.objectPropertyName] forLogLevel:JSONParserLogLevelInfo];
                    continue;
                }
            }
        }
    }
    
    return parsedObject;
}

- (NSArray *) parseArraysOfObjects:(id) result withObjectSpec:(id<JSONObjectSpec>) spec{
    NSMutableArray *vos = [NSMutableArray array];
    for(id object in result){
        id vo = [self parseObjectFromJSONObject:object withSpec:spec];
        [vos addObject:vo];
    }
    return [NSArray arrayWithArray:vos];
}

@end
