//
//  Request+Gzip.h
//  ParkingDoor
//
//  Created by Carlos Jiménez Pacho on 14/1/16.
//  Copyright © 2016 ObtureCODE. All rights reserved.
//

#import "Request.h"

@interface Request (Gzip)

- (NSDictionary*) gzipHttpHeaderFromDictionary:(NSDictionary*)dictionary;

@end
