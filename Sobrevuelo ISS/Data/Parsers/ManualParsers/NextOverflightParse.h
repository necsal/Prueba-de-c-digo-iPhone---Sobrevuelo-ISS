//
//  NextOverflightParse.h
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 11/8/19.
//  Copyright © 2018 Necsal All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Overflight.h"

@interface NextOverflightParse : NSObject

- (Overflight *)parseNextOverflight:(NSString *)overflightString;

@end
