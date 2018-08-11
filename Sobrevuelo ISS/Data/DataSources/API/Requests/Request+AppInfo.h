//
//  Request+Source.h
//  elparking
//
//  Created by Carlos Jiménez Pacho on 8/3/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#import "Request.h"

@interface Request (AppInfo)
- (NSDictionary *) dicctionaryWithAppInfoFromDictionary:(NSDictionary*)dictionary;
@end
