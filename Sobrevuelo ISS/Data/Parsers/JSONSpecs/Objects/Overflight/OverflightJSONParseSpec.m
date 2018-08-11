//
//  OverflightJSONSpec.m
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "OverflightJSONParseSpec.h"
#import "Overflight.h"
#import "JSONParserParameter.h"

@implementation OverflightJSONParseSpec

- (Class)objectType {
    return [Overflight class];
}

- (NSArray *)parseStructure {
    
    return @[
        [[JSONParserParameter alloc] initWithObjectPropertyName:@"duration" JSONKey:@"duration" andParamType:RequestSupportedParseTypeInt],
        [[JSONParserParameter alloc] initWithObjectPropertyName:@"risetime" JSONKey:@"risetime" andParamType:RequestSupportedParseTypeInt]
        ];
}

@end
