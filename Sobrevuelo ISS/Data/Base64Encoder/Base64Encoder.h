//
//  Base64Encoder.h
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 30/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Base64Encoder <NSObject>

- (NSString *) base64EncondedString:(NSString *) string;

@end
