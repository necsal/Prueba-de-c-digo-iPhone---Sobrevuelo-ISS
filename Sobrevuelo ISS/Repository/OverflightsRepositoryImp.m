//
//  OverflightsRepositoryImp.m
//  necsal
//
//  Created by Alvaro Hernández Ojeda on 10/8/18.
//  Copyright © 2018 Necsal All rights reserved.
//

#import "OverflightsRepositoryImp.h"
#import "NSError+Repository.h"

@interface OverflightsRepositoryImp () {
    id<APIDataSource> _apiDataSource;
    OverflightValidator *_overflightValidator;
}

@end

@implementation OverflightsRepositoryImp

- (instancetype)initWithAPIDataSource:(id<APIDataSource>)apiDataSource overflightValidator:(OverflightValidator *)overflightValidator {
    self = [super init];
    if (self) {
        _apiDataSource = apiDataSource;
        _overflightValidator = overflightValidator;
    }
    return self;
}

- (NSArray *)getOverflightsWithLatitude:(NSNumber *)latitude longitude:(NSNumber *)longitude error:(NSError **)error {

    NSError *dataSourceError = nil;
    NSArray *overflights = [_apiDataSource getOverflightsWithLatitude:latitude longitude:longitude error:&dataSourceError];
    if (dataSourceError) {
        NSError *repositoryError = [NSError convertToRepositoryFromDataSourceError:dataSourceError];
        if (error) {
            *error = repositoryError;
        }
    } else {
        if (![_overflightValidator isArrayValid:overflights]) {
            *error = [NSError repositoryErrorWithCode:RepositoryErrorUnknown];
        }
    }

    return overflights;
}

@end
