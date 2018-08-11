//
//  OverflightsRepositoryImp.h
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OverflightsRepository.h"
#import "APIDataSource.h"
#import "OverflightValidator.h"

@interface OverflightsRepositoryImp : NSObject <OverflightsRepository>

- (instancetype)initWithAPIDataSource:(id<APIDataSource>)apiDataSource overflightValidator:(OverflightValidator *)overflightValidator;

@end
