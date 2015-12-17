//
//  BaseEntity.m
//  Sobrevuelo ISS
//
//  Created by Álvaro Hernández Ojeda on 16/12/15.
//  Copyright © 2015 Álvaro Hernández Ojeda. All rights reserved.
//

#import "PassEntity.h"

@implementation PassEntity
@synthesize duration, risetime;

-(id)initWithJSONData:(NSDictionary*)data{
    self = [super init];
    if(self){
        self.duration = [data objectForKey:@"duration"];
        self.risetime = [data objectForKey:@"risetime"];
    }
    return self;
}
@end