//
//  LocationController.m
//  Sobrevuelo ISS
//
//  Created by Álvaro Hernández Ojeda on 15/12/15.
//  Copyright © 2015 Álvaro Hernández Ojeda. All rights reserved.
//

#import "LocationManager.h"

@implementation LocationController {
    CLPlacemark *placemark;
}

@synthesize longitud, latitud, direccion;

static LocationController *sharedInstance;

int intentosSeguidos = 0;
CLLocation *locInicio;
CLLocation *locFin;
bool capturando = false;

+ (LocationController *)sharedInstance {
    @synchronized(self) {
        if (!sharedInstance)
            sharedInstance=[[LocationController alloc] init];
    }
    return sharedInstance;
}

+(id)alloc {
    @synchronized(self) {
        NSAssert(sharedInstance == nil, @"Intento de asignar una segunda instancia de un singleton LocationController.");
        sharedInstance = [super alloc];
    }
    return sharedInstance;
}

-(id) init {
    if (self = [super init]) {
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
        
        //kCLLocationAccuracyBest para mejorar la señal
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        
        //Distancia inicial de muestreo (cada 100 metros) esta variable se irá ajustando según la
        //velocidad obtenida por medio de las anteriores muestras
        locationManager.distanceFilter = 100; //cada 100 metros
        
        // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
        if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [locationManager requestWhenInUseAuthorization];
        }
        
        //iniciamos también el geocoder
        geocoder = [[CLGeocoder alloc] init];
        
        [self start];
    }
    return self;
}


-(void) start {
    [locationManager startUpdatingLocation];
}

-(void) stop {
    [locationManager stopUpdatingLocation];
}

#pragma mark CLLocationManagerDelegate Methods

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    CLLocation *currentLocation = [locations lastObject];
    
    CLLocationAccuracy accuracy = [currentLocation horizontalAccuracy];
    if(accuracy < 100.0) {
    
        // si la precisión es aceptable paramos la obtención de posición
        [manager stopUpdatingLocation];
        
        if (currentLocation != nil) {
            latitud = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
            longitud = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        }
    
        // preparemos la dirección postal
        [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        
            if (error == nil && [placemarks count] > 0) {
            
                placemark = [placemarks lastObject];
            
                // formateamos la dirección
                if (placemark.subThoroughfare != nil) {
                    direccion = [NSString stringWithFormat:@"%@ %@, %@, %@, %@, %@",
                                  placemark.subThoroughfare, placemark.thoroughfare,
                                  placemark.postalCode, placemark.locality,
                                  placemark.administrativeArea,
                                  placemark.country];
                } else {
                    direccion = [NSString stringWithFormat:@"%@, %@, %@, %@, %@",
                                 placemark.thoroughfare,
                                 placemark.postalCode, placemark.locality,
                                 placemark.administrativeArea,
                                 placemark.country];
                }
                
                // mandamos la notivicación de que ya tenemos la localización
                [[NSNotificationCenter defaultCenter] postNotificationName:@"requestFinished"
                                                                    object:self
                                                                  userInfo:nil];
            } else {
                NSLog(@"%@", error.debugDescription);
            }
        
        } ];
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"didFailWithError");
}

@end

