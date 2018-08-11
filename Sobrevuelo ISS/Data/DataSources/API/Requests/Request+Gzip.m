//
//  Request+Gzip.m
//  ParkingDoor
//
//  Created by Carlos Jiménez Pacho on 14/1/16.
//  Copyright © 2016 ObtureCODE. All rights reserved.
//

#import "Request+Gzip.h"

@implementation Request (Gzip)
- (NSDictionary*) gzipHttpHeaderFromDictionary:(NSDictionary*)dictionary{
    
    NSMutableDictionary *gzipHttpHeaderDictionary = [[NSMutableDictionary alloc]init];
    [gzipHttpHeaderDictionary setObject:@"gzip" forKey:@"Accept-Encoding"];
    [gzipHttpHeaderDictionary addEntriesFromDictionary:dictionary];
    
    return [NSDictionary dictionaryWithDictionary:gzipHttpHeaderDictionary];
}
@end
