//
//  ErrorMessagesHandler.h
//  elparking
//
//  Created by Carlos Jiménez Pacho on 10/3/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#ifndef ErrorMessagesHandler_h
#define ErrorMessagesHandler_h

#endif /* ErrorMessagesHandler_h */

@protocol ErrorTranslater <NSObject>

- (NSString *)getMessageFromDomainError:(NSError *)error;

@end