//
//  LocationController.h
//  Sobrevuelo ISS
//
//  Created by Álvaro Hernández Ojeda on 15/12/15.
//  Copyright © 2015 Álvaro Hernández Ojeda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface  LocationController : NSObject <CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    
    NSString *latitud;
    NSString *longitud;
    NSString *direccion;
}

+ (LocationController *)sharedInstance;

-(void) start;
-(void) stop;

@property (retain, nonatomic) NSString *latitud;
@property (retain, nonatomic) NSString *longitud;
@property (retain, nonatomic) NSString *direccion;

@end
