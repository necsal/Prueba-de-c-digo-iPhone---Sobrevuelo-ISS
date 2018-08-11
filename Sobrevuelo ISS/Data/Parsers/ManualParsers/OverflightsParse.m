//
//  OverflightsParse.m
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 11/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "OverflightsParse.h"
#import "JSONSerializer.h"
#import "JSONSerializerImp.h"
#import "OverflightResponseJSONSpec.h"
#import "JSONParser.h"
#import "Overflight.h"

@implementation OverflightsParse

- (NSArray *)parseOverflights:(NSString *)overflightsString {

    id<JSONSerializer> jsonSerializer = [[JSONSerializerImp alloc] init];
    id overflightsJSONObject = [jsonSerializer convertJSONStringToDictionaryOrArray:overflightsString];

    JSONParser *jsonParser = [[JSONParser alloc] init];
    NSArray *overflights = [overflightsJSONObject objectForKey:@"response"];
    NSMutableArray *overflightsParsed = [[NSMutableArray alloc] init];
    for (id overflightJSONObject in overflights) {
        NSString *overflightString = [jsonSerializer convertDictionaryOrArrayToJSONString:overflightJSONObject];
        Overflight *overflight = [jsonParser parseString:overflightString withSpec:[[OverflightResponseJSONSpec alloc] init]];
        [overflightsParsed addObject:overflight];
    }
    
    return overflightsParsed;
}

@end
