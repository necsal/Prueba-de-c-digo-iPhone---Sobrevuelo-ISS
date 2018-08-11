//
//  MessageView.h
//  elparking
//
//  Created by Carlos Jiménez Pacho on 10/3/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#ifndef MessageView_h
#define MessageView_h

#endif /* MessageView_h */

@protocol MessageView <NSObject>

@property(retain, nonatomic) NSString *message;
@property(retain, nonatomic) NSString *title;
- (void)addActionWithTitle:(NSString *)title andAction:(void (^)(void))action;
- (void)show;
- (void)resetMessageView;

@end