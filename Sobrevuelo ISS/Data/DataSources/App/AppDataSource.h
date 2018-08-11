//
//  AppDataSource.h
//  ParkingDoor
//
//  Created by Carlos Jiménez Pacho on 11/11/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#ifndef AppDataSource_h
#define AppDataSource_h

#endif /* AppDataSource_h */

@protocol AppDataSource <NSObject>

- (NSString *)getCurrentVersion;
- (NSString *)getCurrentBuild;
- (NSString *)completeCurrentVersionAndBuild;
@end
