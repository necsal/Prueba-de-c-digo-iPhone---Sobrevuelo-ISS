//
//  ErrorMessagesHandler.m
//  elparking
//
//  Created by Carlos Jiménez Pacho on 9/3/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#import "ErrorTranslaterImp.h"
#import "InteractorErrors.h"

@implementation ErrorTranslaterImp

- (NSString *)getMessageFromDomainError:(NSError *)error {
    NSString *message = nil;
    if (error.code == DomainErrorNoInternet) {
        message = @"Upps, revisa tu conexión a Internet e inténtalo de nuevo.";
    } else if (error.code == DomainErrorUnauthorized) {
        message = @"Tienes que volver a iniciar sesión.";
    } else {
        message = @"Se ha producido un error, inténtalo de nuevo más tarde";
    }
    return message;
}

@end



