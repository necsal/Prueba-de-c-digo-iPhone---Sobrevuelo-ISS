//
//  Header.h
//  ParkingDoor
//
//  Created by Cristina Folgueral Gutiérrez on 23/4/15.
//  Copyright (c) 2016 El Parking Internet S.L.. All rights reserved.
//

#ifndef ParkingDoor_RepositoryErrors_h
#define ParkingDoor_RepositoryErrors_h

#define RepositoryErrorDomain @"Repository"

typedef enum {
    RepositoryErrorNoInternet = 1000,
    RepositoryErrorUnknown,
    RepositoryErrorUnauthorized,

    RepositoryErrorEmailPasswordMissmatch,
    RepositoryErrorUserNotValidated,
    RepositoryErrorUserNotExist,
    RepositoryErrorEmailTaken,
    RepositoryErrorPasswordMissmatch,
    RepositoryErrorCantLoginSocial,
    RepositoryErrorUserHasEysaAccount,
    RepositoryErrorRegisteredInOtherApp,

    RepositoryErrorOutOfHour,
    RepositoryErrorStayInProgress,
    RepositoryErrorNotValidContract,
    RepositoryErrorRotationNotSupported,
    RepositoryErrorRotationCreditCardExpired,
    RepositoryErrorPaymentMethodNotSupported,
    RepositoryErrorRotationParkingClosed,
    RepositoryErrorRotationWalletWithDebt,
    RepositoryErrorRotationParkingFull,
    
    RepositoryErrorUpdateRequired,
    
    RepositoryErrorCreditCardExpired,
    RepositoryErrorCreditCardCvcInvalid,
    RepositoryErrorCreditCardDenied,

    RepositoryErrorVehicleInUse,

    RepositoryErrorStepsUserTimeSpent,
    RepositoryErrorStepsInvalidRateForZone,
    RepositoryErrorStepsPollutionProhibition,
    RepositoryErrorStepsPlatformError,
    RepositoryErrorStepsPrideError,

    RepositoryErrorNotEnoughFundsInWallet,

    RepositoryErrorFineCantCancel,
    RepositoryErrorFineAlreadyAnnulled,
    RepositoryErrorFineInvalid,
    RepositoryErrorFineOutOfTime,
    RepositoryErrorFineNotAnnullable,
    RepositoryErrorFineNotFound,
    RepositoryErrorFinePollutionProhibition,

    RepositoryErrorTicketAlreadyExist,
    RepositoryErrorTicketPlatformError,

    RepositoryErrorUnparkOutOfTime,
    RepositoryErrorUnparkTooSlow,
    RepositoryErrorUnparkAlreadyUnparked,

    RepositoryErrorRateNotAvailableAtThisTime,

    RepositoryErrorImpossibleLoginEysaMobile,
    RepositoryErrorRecoverPasswordEysaMobileUserNotExists,

    RepositoryErrorBookingUnavailable,
    RepositoryErrorBookingParkingFull,
    RepositoryErrorBookingParkingClosed,
    RepositoryErrorCreateBooking,

    RepositoryErrorContractSeasonTicketForbidden,
    RepositoryErrorContractSeasonTicketLimitReached,

    RepositoryErrorDisableAutoRechargeWithPagateliaError,
    RepositoryErrorAutoRechargeErrorRecharging,

    RepositoryErrorCantRechargeBecauseUserHasDebt,
    RepositoryErrorCantSettleUp,

    RepositoryErrorCouponNotFound,
    RepositoryErrorCouponExpired,
    RepositoryErrorCouponAlreadyRedeemed,
    RepositoryErrorCouponAndWalletDifferentCurrency,

    RepositoryErrorMutuaSessionTooOld,

    RepositoryErrorVehicleAutoOpenPermissionAlreadyAssigned,

    RepositoryErrorCreditCardInUse,

    RepositoryErrorBookingExceededAdvanceTime,
    RepositoryErrorBookingMaximumTimeExceeded,
    RepositoryErrorBookingMinimumTimeNotReached,

    RepositoryErrorAssociateVehicleToMobePagateliaNumberPlateAlreadyTaken,

    RepositoryErrorAssociateWalletToMobePagateliaForbidden,

    RepositoryErrorInvalidAdvanceTimeForBooking,

    RepositoryErrorRemoteDoorNotFound,
    RepositoryErrorRemoteDoorCantActivateDevice,
    RepositoryErrorRemoteDoorNotSupport,
    RepositoryErrorRemoteDoorOpenButAccessNotRegistered,
    
    RepositoryErrorUserNeedsSpecifyCountry,
    
    RepositoryErrorCreateRefuelTicketNotEnoughFundsInWallet,
    
    RepositoryErrorBookingIsNotCancelable
    
} RepositoryErrorCode;

#endif
