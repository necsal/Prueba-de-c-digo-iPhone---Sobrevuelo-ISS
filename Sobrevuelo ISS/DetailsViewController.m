//
//  DetailsViewController.m
//  Sobrevuelo ISS
//
//  Created by Álvaro Hernández Ojeda on 17/12/15.
//  Copyright © 2015 Álvaro Hernández Ojeda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailsViewController.h"

@implementation DetailsViewController

@synthesize durationLabel, risetimeLabel, pass;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    durationLabel.text = [NSString stringWithFormat:@"%@", pass.duration];
    risetimeLabel.text = [NSString stringWithFormat:@"%@", pass.risetime];
}

@end