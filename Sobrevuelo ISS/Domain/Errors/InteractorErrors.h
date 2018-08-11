//
//  InteractorErrors.h
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 27/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#ifndef ParkingDoor_InteractorErrors_h
#define ParkingDoor_InteractorErrors_h

#define InteractorErrorDomain @"Interactor"

typedef enum {
    DomainErrorNoInternet = 1000,
    DomainErrorUnknown,
    DomainErrorUnauthorized,
    
    DomainErrorLocationUnavailable,
    DomainErrorLocationDenied,
    DomainErrorLocationUnknown
} DomainErrorCode;

#endif
