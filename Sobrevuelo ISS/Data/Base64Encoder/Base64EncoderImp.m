//
//  Base64EncoderImp.m
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 30/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#import "Base64EncoderImp.h"

@implementation Base64EncoderImp

- (NSString *)base64EncondedString:(NSString *)string {
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    data = [data base64EncodedDataWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end
