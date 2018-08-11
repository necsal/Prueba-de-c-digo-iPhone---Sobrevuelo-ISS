//
//  Validator.h
//  elparking
//
//  Created by Carlos Jiménez Pacho on 4/3/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//
#import <Foundation/Foundation.h>

#ifndef Validator_h
#define Validator_h

#endif /* Validator_h */

@protocol RepositoryValidator <NSObject>

- (BOOL)isValid:(id)object;
- (BOOL)isArrayValid:(NSArray *)objects;
@optional
- (BOOL)isArrayValid:(NSArray *)objects withOneElementAtLeast:(BOOL)oneElementRequired;
@end
