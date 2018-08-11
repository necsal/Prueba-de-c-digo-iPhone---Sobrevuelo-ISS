//
//  NSError+BaseInteractor.h
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 27/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#import "InteractorErrors.h"
#import <Foundation/Foundation.h>

@interface NSError (BaseInteractor)

+ (NSError *)domainErrorWithCode:(DomainErrorCode)errorCode;
+ (NSError *)convertToInteractorErrorFromRepositoryError:(NSError *)repositoryError;
+ (NSError *)convertToInteractorErrorFromLocationError:(NSError *)locationError;

@end
