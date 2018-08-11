//
//  DeviceModelImp.m
//  ParkingDoor
//
//  Created by Carlos Jiménez Pacho on 2/12/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#import "DeviceModelNameImp.h"
#import "DeviceUtil.h"

@implementation DeviceModelNameImp
- (NSString*)deviceModel{
    return [DeviceUtil hardwareDescription];
}
@end
