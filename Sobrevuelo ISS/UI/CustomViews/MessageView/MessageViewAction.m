//
//  MessageViewAction.m
//  elparking
//
//  Created by Carlos Jiménez Pacho on 10/3/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#import "MessageViewAction.h"

@interface MessageViewAction () {
}

@end

@implementation MessageViewAction

- (instancetype)initWithTitle:(NSString *)title andAction:(void (^)(void))action {
    self = [super init];
    if (self) {
        _title = title;
        _action = action;
    }
    return self;
}

@end
