//
//  Request+Source.m
//  elparking
//
//  Created by Carlos Jiménez Pacho on 8/3/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#import "Request+AppInfo.h"
#import "AppDataSource.h"
#import "AppDataSourceImp.h"
#import "DeviceDataSource.h"
#import "DeviceDataSourceImp.h"

@implementation Request (AppInfo)

- (NSDictionary *)dicctionaryWithAppInfoFromDictionary:(NSDictionary *)dictionary {

    id<AppDataSource> appDataSource = [[AppDataSourceImp alloc] init];
    id<DeviceDataSource> deviceDataSource = [[DeviceDataSourceImp alloc] init];

    NSMutableDictionary *sourceInfo = [[NSMutableDictionary alloc] init];
    [sourceInfo setObject:@"elparking" forKey:@"ep-app-name"];
    [sourceInfo setObject:[appDataSource getCurrentVersion] forKey:@"ep-app-version"];
    [sourceInfo setObject:@"ios" forKey:@"ep-app-os"];
    NSString *advertisingId = [deviceDataSource advertisingIdIfAvailable];
    if (advertisingId) {
        [sourceInfo setObject:advertisingId forKey:@"ep-app-advertising-id"];
    }
    [sourceInfo setObject:[deviceDataSource isoLocalLanguage] forKey:@"ep-app-lang"];
    [sourceInfo addEntriesFromDictionary:dictionary];

    return [NSDictionary dictionaryWithDictionary:sourceInfo];
}

@end
