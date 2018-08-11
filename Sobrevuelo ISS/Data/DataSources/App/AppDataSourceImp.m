//
//  AppDataSourceImp.m
//  ParkingDoor
//
//  Created by Carlos Jiménez Pacho on 11/11/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#import "AppDataSourceImp.h"

static NSString *VERSION_KEY = @"CFBundleShortVersionString";

@implementation AppDataSourceImp

- (NSString *)getCurrentVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:VERSION_KEY];
}

- (NSString *)getCurrentBuild {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];
}

- (NSString *)completeCurrentVersionAndBuild {
    NSString *version = [self getCurrentVersion];
    NSString *build = [self getCurrentBuild];
    return [NSString stringWithFormat:@"%@ (%@)", version, build];
}
@end
