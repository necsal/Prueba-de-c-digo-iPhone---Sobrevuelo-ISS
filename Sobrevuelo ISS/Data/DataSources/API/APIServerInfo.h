//
//  APIServerInfo.h
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 22/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceLocator.h"

//#define API_HOST [((AppDelegate*)[UIApplication sharedApplication].delegate).config getAPIURL]
#define API_HOST [[ServiceLocator provideConfig] getAPIURL]
#define HEADER_JSON [NSDictionary dictionaryWithObject:@"application/json" forKey:@"Content-Type"]
#define HEADER_PDF [NSDictionary dictionaryWithObject:@"application/pdf" forKey:@"Content-Type"]

#define API_ENCONDING NSUTF8StringEncoding
