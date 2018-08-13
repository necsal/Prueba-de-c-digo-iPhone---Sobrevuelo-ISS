//
//  GeoreverseDataSourceImp.m
//  elparking
//
//  Created by Alvaro Hernández Ojeda on 30/6/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#import "GeoreverseDataSourceImp.h"
#import "NSError+GeoreverseDataSource.h"
@import GoogleMaps;

@interface GeoreverseDataSourceImp () {
    __weak id<GeoreverseDataSourceCallback> _callback;
    GMSGeocoder *_geocoder;
}

@end

@implementation GeoreverseDataSourceImp

- (void)addressFromLocation:(Location *)location withCallback:(id<GeoreverseDataSourceCallback>)callback {
    _callback = callback;
    GMSGeocoder *geocoder = [GMSGeocoder geocoder];
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake([location.latitude floatValue], [location.longitude floatValue]);
    
    [geocoder reverseGeocodeCoordinate:coordinate completionHandler:^(GMSReverseGeocodeResponse *response, NSError *error) {
        if ([[response results] count] > 0) {
            NSString *address = @"";
            NSString *street = [[[[response results] firstObject] lines] firstObject];
            NSString *city = [[[response results] firstObject] locality];
            NSString *cp = [[[response results] firstObject] postalCode];
            
            if (street) {
                address = street;
            }
            
            if (cp) {
                if ([address length] != 0) {
                    address = [NSString stringWithFormat:@"%@ ", address];
                }
                
                address = [NSString stringWithFormat:@"%@%@", address, cp];
            }
            
            if (city) {
                if ([address length] != 0) {
                    address = [NSString stringWithFormat:@"%@ ", address];
                }
                
                address = [NSString stringWithFormat:@"%@%@", address, city];
            }
            
            [_callback georeverseDataSourceOk:address];
        } else {
            [_callback georeverseDataSourceError:[NSError georeverseDataSourceErrorWithCode:GeoreverseDataSourceNotFoundError]];
        }
    }];
}

@end
