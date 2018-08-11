//
//  JSONSerializerImp.m
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 22/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#import "JSONSerializerImp.h"

@implementation JSONSerializerImp

- (NSString *) convertDictionaryOrArrayToJSONString:(id) toConvert{
    NSData * convertedData = [NSJSONSerialization dataWithJSONObject:toConvert
                                    options:0
                                      error:nil];
    return [[NSString alloc] initWithData:convertedData encoding:NSUTF8StringEncoding];
}

- (id) convertJSONStringToDictionaryOrArray:(NSString *) toConvert{
    return [NSJSONSerialization JSONObjectWithData:[toConvert dataUsingEncoding:NSUTF8StringEncoding]
                                                         options:0
                                                           error:nil];
    
}

@end
