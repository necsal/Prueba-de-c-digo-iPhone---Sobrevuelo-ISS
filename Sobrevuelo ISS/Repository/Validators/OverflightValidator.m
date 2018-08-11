//
//  OverflightValidator.m
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "OverflightValidator.h"
#import "Overflight.h"

@interface OverflightValidator () {
    Validator *_validator;
}

@end

@implementation OverflightValidator

- (instancetype)initWithValidator:(Validator *)validator {
    self = [super init];
    if (self) {
        _validator = validator;
    }
    return self;
}

- (BOOL)isValid:(id)object {

    Overflight *overflight = (Overflight *)object;

    if (![_validator isNumberNotNil:overflight.duration]) {
        return NO;
    }
    
    if (![_validator isNumberNotNil:overflight.risetime]) {
        return NO;
    }

    return YES;
}

- (BOOL)isArrayValid:(NSArray *)objects {
    if (objects == nil)
        return NO;

    for (Overflight *overflight in objects) {
        if (![self isValid:overflight])
            return NO;
    }
    return YES;
}

@end
