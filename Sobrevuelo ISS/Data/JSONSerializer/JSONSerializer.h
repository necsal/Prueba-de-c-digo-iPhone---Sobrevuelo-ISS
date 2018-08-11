//
//  JSONSerializer.h
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 22/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#ifndef ParkingDoor_JSONSerializer_h
#define ParkingDoor_JSONSerializer_h

@protocol JSONSerializer <NSObject>

- (NSString *) convertDictionaryOrArrayToJSONString:(id) toConvert;
- (id) convertJSONStringToDictionaryOrArray:(NSString *) toConvert;

@end


#endif
