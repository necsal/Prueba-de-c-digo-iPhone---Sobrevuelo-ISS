//
//  OverflightValidator.h
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RepositoryValidator.h"
#import "Validator.h"

@interface OverflightValidator : NSObject <RepositoryValidator>

- (instancetype)initWithValidator:(Validator *)validator;

@end
