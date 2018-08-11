//
//  DeviceDataSource.h
//  elparking
//
//  Created by Carlos Jiménez Pacho on 4/3/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#ifndef DeviceDataSource_h
#define DeviceDataSource_h

#endif /* DeviceDataSource_h */

@protocol DeviceDataSource <NSObject>

- (NSString *)deviceDescription;
- (NSString *)deviceIdentifier;
- (NSString *)localLanguage;
- (NSString *)localCountryCode;
- (NSString *)isoLocalLanguage;
- (NSString *)advertisingIdIfAvailable;

@end
