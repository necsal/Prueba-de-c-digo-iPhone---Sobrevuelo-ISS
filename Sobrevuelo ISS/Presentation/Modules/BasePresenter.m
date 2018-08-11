//
//  BasePresenter.m
//  elparking
//
//  Created by Carlos Jiménez Pacho on 10/3/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#import "BasePresenter.h"
#import "InteractorErrors.h"
#import "ServiceLocator.h"

@implementation BasePresenter

- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appIsGoingToBackground) name:@"notification_app_going_to_background" object:nil];
    }
    return self;
}

- (void)appIsGoingToBackground {
}

- (void)handleError:(NSError *)error {
    [self handleError:error completion:nil];
}

- (void)handleError:(NSError *)error completion:(void (^)(void))completion {
    NSString *errorMessage = [_errorTranslater getMessageFromDomainError:error];
    if (error.code == DomainErrorUnauthorized) {
        NSLog(@"BasePresenter -> DomainErrorUnauthorized");
    } else {
        [self showMessage:errorMessage
                 andTitle:NSLocalizedStringWithDefaultValue(@"warning_wait_a_second", @"Localizable", [NSBundle mainBundle], @"Un momento...",
                                                            @"Título de los cuadros de diálogo de aviso al usuario cuando se produce un error")
               userAction:completion];
    }
}

- (void)showMessage:(NSString *)message andTitle:(NSString *)title {
    [self showMessage:message andTitle:title userAction:nil];
}

- (void)showMessage:(NSString *)message andTitle:(NSString *)title userAction:(void (^)(void))userAction {
    [_messageView resetMessageView];
    _messageView.message = message;
    _messageView.title = title;

    [_messageView addActionWithTitle:NSLocalizedStringWithDefaultValue(@"dialog_ok", @"Localizable", [NSBundle mainBundle], @"OK",
                                                                       @"Este texto suele ir en cuadros de diálogo con un sólo botón (o no). Siempre que se pulsa, el cuadro de diálogo se oculta")
                           andAction:^() {
                             if (userAction) {
                                 userAction();
                             }
                           }];
    [_messageView show];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
