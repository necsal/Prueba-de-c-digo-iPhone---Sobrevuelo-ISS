//
//  ViewController.m
//  Sobrevuelo ISS
//
//  Created by Álvaro Hernández Ojeda on 14/12/15.
//  Copyright © 2015 Álvaro Hernández Ojeda. All rights reserved.
//

#import "ViewController.h"
#import "LocationManager.h"
#import "Constants.h"
#import "PassEntity.h"
#import "DetailsViewController.h"

@interface ViewController () <CLLocationManagerDelegate>

@end

@implementation ViewController {
    NSArray *details;
}

LocationController *locMan;
NSMutableArray *passArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // iniciamos la localización para recuperar los datos
    locMan = [LocationController sharedInstance];
    [locMan start];
    
    // esperamos la notificación para continuar con la ejecución
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(requestFinishedHandler:)
                                                 name:@"requestFinished"
                                               object:nil];
}

- (void)requestFinishedHandler:(NSNotification *)notification
{
    _estasEn.text = locMan.direccion;
    
    NSString *urlApi = [NSString stringWithFormat:URL_ISS_PASS, locMan.latitud, locMan.longitud];
    
    [self makeRestAPICall:urlApi];
}

#pragma mark TableView Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [passArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
    }
    
    if ([passArray count] == 0) {
        cell.textLabel.text = @"No hay pases que mostrar";
    }
    else {
        // recuperamos la celda
        PassEntity *pass = [passArray objectAtIndex:indexPath.row];
        
        // pintamos los datos
        NSString *risetime = [pass risetime];
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:[risetime longLongValue]];

        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"EEEE dd-mm-yyyy hh:MM:ss"];
        
        cell.textLabel.text = [formatter stringFromDate:date];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Durante %@ segundos", [pass duration]];
        
        // personalizamos la celda
        cell.imageView.image = [UIImage imageNamed:ISS_AVATAR_CELL];
        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:ARROW_CELL]];
    }
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // llamamos a la vista de detalle
    [self performSegueWithIdentifier:@"detailsIdentity" sender:self];
}

#pragma mark Vista de detalle

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // verificamos que el identificador es el que esperabamos
    if ([segue.identifier isEqualToString:@"detailsIdentity"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailsViewController *detailsViewController = segue.destinationViewController;
        detailsViewController.pass = [passArray objectAtIndex:indexPath.row];
    }
}

#pragma mark RestAPICall Methods

-(void) makeRestAPICall : (NSString*) reqURLStr
{
    NSURL *url = [NSURL URLWithString:reqURLStr];
    
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession]
      dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
          // tratamos la respuesta
          NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
   
          // nos quedamos con el response y lo pasamos a json NSData
          NSDictionary *jsonResponse = [json objectForKey:@"response"];
          NSData *dataResponse = [NSJSONSerialization dataWithJSONObject:jsonResponse
                                                                options:NSJSONReadingAllowFragments
                                                                   error:&error];
          
          passArray = [[NSMutableArray alloc] init];
          NSArray *arrayFromServer = [NSJSONSerialization JSONObjectWithData:dataResponse options:0 error:nil];
          
          if(error){
              NSLog(@"error parsing the json data from server with error description - %@", [error localizedDescription]);
          }
          else {
              passArray = [[NSMutableArray alloc] init];
              for(NSDictionary *eachPass in arrayFromServer) {
                  PassEntity *pass = [[PassEntity alloc] initWithJSONData:eachPass];
                  [passArray addObject:pass];
              }
              
              [self.tableView reloadData];
          }
      }];
    
    [downloadTask resume];
}

@end
