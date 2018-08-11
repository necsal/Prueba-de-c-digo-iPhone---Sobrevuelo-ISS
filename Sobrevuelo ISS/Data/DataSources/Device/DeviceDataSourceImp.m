//
//  DeviceDataSourceImp.m
//  elparking
//
//  Created by Carlos Jiménez Pacho on 4/3/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#import "DeviceDataSourceImp.h"
#import "DeviceModelName.h"
#import "DeviceModelNameImp.h"

@import AdSupport;
@import UIKit;

@implementation DeviceDataSourceImp

- (NSString *)deviceDescription {
    id<DeviceModelName> deviceModelName = [[DeviceModelNameImp alloc] init];
    return [NSString stringWithFormat:@"%@ - %@ %@", deviceModelName.deviceModel, [[UIDevice currentDevice] systemName], [[UIDevice currentDevice] systemVersion]];
}
- (NSString *)deviceIdentifier {
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}
- (NSString *)localLanguage {
    NSString *locale = [[NSLocale preferredLanguages] objectAtIndex:0];
    NSString *languageCode = [locale substringToIndex:2];
    return languageCode;
}
- (NSString *)localCountryCode {
    return [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode];
}

- (NSString *)isoLocalLanguage {
    return [[NSLocale preferredLanguages] objectAtIndex:0];
}

- (NSString *)advertisingIdIfAvailable {
    if ([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]) {
        NSUUID *identifier = [[ASIdentifierManager sharedManager] advertisingIdentifier];
        return [identifier UUIDString];
    }

    return nil;
}

@end
