//
//  BaseEntity.h
//  Sobrevuelo ISS
//
//  Created by Álvaro Hernández Ojeda on 16/12/15.
//  Copyright © 2015 Álvaro Hernández Ojeda. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface PassEntity : NSObject

-(id)initWithJSONData:(NSDictionary*)data;

@property (nonatomic) NSString *duration;
@property (nonatomic) NSString *risetime;

@end
