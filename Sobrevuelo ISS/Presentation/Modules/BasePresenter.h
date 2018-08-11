//
//  BasePresenter.h
//  elparking
//
//  Created by Carlos Jiménez Pacho on 10/3/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ErrorTranslater.h"
#import "MessageView.h"

@interface BasePresenter : NSObject {
    id<ErrorTranslater> _errorTranslater;
    id<MessageView> _messageView;
}

- (void)handleError:(NSError *)error completion:(void (^)(void))completion;
- (void)handleError:(NSError *)error;
- (void)showMessage:(NSString *)message andTitle:(NSString *)title;
@end
