//
//  NSError+Repository.h
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 23/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RepositoryErrors.h"

@interface NSError (Repository)

+ (NSError *)repositoryErrorWithCode:(RepositoryErrorCode)errorCode;
+ (NSError *)convertToRepositoryFromDataSourceError:(NSError *)dataSourceError;

@end
