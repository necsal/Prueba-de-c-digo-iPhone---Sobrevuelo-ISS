
//
//  NextOverflightsParse.m
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 11/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "NextOverflightParse.h"
#import "JSONSerializer.h"
#import "JSONSerializerImp.h"
#import "OverflightResponseJSONSpec.h"
#import "JSONParser.h"
#import "Overflight.h"

@implementation NextOverflightParse

- (Overflight *)parseNextOverflight:(NSString *)overflightString {

    id<JSONSerializer> jsonSerializer = [[JSONSerializerImp alloc] init];
    id overflightJSONObject = [jsonSerializer convertJSONStringToDictionaryOrArray:overflightString];

    JSONParser *jsonParser = [[JSONParser alloc] init];
    NSArray *overflights = [overflightJSONObject objectForKey:@"response"];

    id nextOverflightJSONObject = [overflights firstObject];
    NSString *nextOverflightString = [jsonSerializer convertDictionaryOrArrayToJSONString:nextOverflightJSONObject];
    Overflight *overflight = [jsonParser parseString:nextOverflightString withSpec:[[OverflightResponseJSONSpec alloc] init]];

    return overflight;
}

@end
