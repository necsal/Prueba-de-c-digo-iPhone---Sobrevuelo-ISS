//
//  JSONObjectSpec.h
//  OBTRequest
//
//  Created by Cristina Folgueral Gutiérrez on 22/4/15.
//  Copyright (c) 2015 ObtureCODE. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JSONObjectSpec <NSObject>

- (Class) objectType;
- (NSArray *) parseStructure;

@end
