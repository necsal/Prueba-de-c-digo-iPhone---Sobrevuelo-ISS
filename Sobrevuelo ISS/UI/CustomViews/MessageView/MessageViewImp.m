//
//  MessageViewImp.m
//  elparking
//
//  Created by Carlos Jiménez Pacho on 10/3/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#import "MessageViewImp.h"
#import "MessageViewAction.h"
#import "ServiceLocator.h"

@interface MessageViewImp () {
    NSMutableArray *_actions;
}

@end

@implementation MessageViewImp

@synthesize message = _message, title = _title;

- (instancetype)init {
    self = [super init];
    if (self) {
        _actions = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addActionWithTitle:(NSString *)title andAction:(void (^)(void))action {
    MessageViewAction *messageViewAction = [[MessageViewAction alloc] initWithTitle:title andAction:action];
    [_actions addObject:messageViewAction];
}

- (void)show {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:self.title message:self.message preferredStyle:UIAlertControllerStyleAlert];

    for (MessageViewAction *messageViewAction in _actions) {
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:messageViewAction.title
                                                              style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction *action) {
                                                              // Important: since we want to inyect MessageView on initialize methods, we need to reset config and actions added. If not, when we use a
                                                              // MessageView two times following each other, we'll see more actions than we want :)

                                                              MessageViewActionHandler keepAction =
                                                                  messageViewAction.action; // keep action before reset to prevent add same action to second (or third..) MessageView
                                                              [self resetMessageView];
                                                              keepAction();

                                                            }];

        [alert addAction:alertAction];
    }

    // We need provide the top view controller right now (and not before) because if we inject on the initializer, top controller is the previous controller
    UIViewController *visibleViewController = [ServiceLocator provideVisibleViewController];

    if ([visibleViewController isKindOfClass:[UIAlertController class]]) {
        [visibleViewController dismissViewControllerAnimated:NO
                                                  completion:^() {
                                                    [[ServiceLocator provideVisibleViewController] presentViewController:alert
                                                                                                                animated:YES
                                                                                                              completion:^(){
                                                                                                              }];
                                                  }];
    } else {
        [visibleViewController presentViewController:alert animated:YES completion:nil];
    }
}

- (void)resetMessageView {
    _message = nil;
    _title = nil;
    [_actions removeAllObjects];
}

@end
