//
//  MessageViewAction.h
//  elparking
//
//  Created by Carlos Jiménez Pacho on 10/3/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^MessageViewActionHandler)(void);

@interface MessageViewAction : NSObject

@property(retain, readonly) NSString *title;
@property(retain, readonly) MessageViewActionHandler action;
- (instancetype)initWithTitle:(NSString *)title andAction:(void (^)(void))action;

@end
