//
//  GeoreverseUseCase.h
//  elparking
//
//  Created by Alvaro Hernández Ojeda on 30/6/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#import "Location.h"
#ifndef GeoreverseUseCase_h
#define GeoreverseUseCase_h

#endif /* GeoreverseUseCase_h */

@protocol GeoreverseCallback <NSObject>

- (void)georeverseOk:(NSString *)address;
- (void)georeverseError:(NSError *)error;

@end

@protocol GeoreverseUseCase <NSObject>

- (void)executeWithLocation:(Location *)location andGeoreverseCallback:(id<GeoreverseCallback>)callback;

@end
