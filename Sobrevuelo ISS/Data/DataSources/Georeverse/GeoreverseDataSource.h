//
//  GeoreverseDataSource.h
//  elparking
//
//  Created by Alvaro Hernández Ojeda on 30/6/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#import "Location.h"
#ifndef GeoreverseDataSource_h
#define GeoreverseDataSource_h

@protocol GeoreverseDataSourceCallback <NSObject>

- (void)georeverseDataSourceOk:(NSString *)address;
- (void)georeverseDataSourceError:(NSError *)error;

@end

@protocol GeoreverseDataSource <NSObject>

- (void)addressFromLocation:(Location *)location withCallback:(id<GeoreverseDataSourceCallback>)callback;

@end

#endif
