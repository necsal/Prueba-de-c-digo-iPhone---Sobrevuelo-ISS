//
//  Request+Autenticated.h
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 30/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#import "Request.h"

@interface Request (Autenticated)

- (NSDictionary *) dicctionaryWithAutorizationHeaderFromDictionary:(NSDictionary *) dictionary withUser:(NSString *) user andPassword:(NSString *) password;

@end
