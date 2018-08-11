//
//  LoaderMockedResponse.h
//  elparking
//
//  Created by Carlos Jiménez Pacho on 18/3/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoaderMockedResponse : NSObject

+ (NSString *)mockedResponseForRequest:(NSString *)requestName;

@end
