//
//  Request+Autenticated.m
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 30/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#import "Request+Autenticated.h"
#import "Base64Encoder.h"
#import "Base64EncoderImp.h"

@implementation Request (Autenticated)

- (NSDictionary *)dicctionaryWithAutorizationHeaderFromDictionary:(NSDictionary *)dictionary withUser:(NSString *)user andPassword:(NSString *)password {
    NSString *mergedUserAndPass = [NSString stringWithFormat:@"%@:%@", user, password];
    id<Base64Encoder> base64Encoder = [[Base64EncoderImp alloc] init];
    mergedUserAndPass = [base64Encoder base64EncondedString:mergedUserAndPass];
    NSString *authorizationHeader = [NSString stringWithFormat:@"Basic %@", mergedUserAndPass];
    NSMutableDictionary *toReturndictionary = [NSMutableDictionary dictionaryWithDictionary:dictionary];
    [toReturndictionary setObject:authorizationHeader forKey:@"Authorization"];
    return [NSDictionary dictionaryWithDictionary:toReturndictionary];
}

@end
