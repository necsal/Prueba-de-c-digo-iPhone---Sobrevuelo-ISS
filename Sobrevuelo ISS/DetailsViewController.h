//
//  DetailsViewController.h
//  Sobrevuelo ISS
//
//  Created by Álvaro Hernández Ojeda on 17/12/15.
//  Copyright © 2015 Álvaro Hernández Ojeda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PassEntity.h"

@interface DetailsViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *durationLabel;
@property (nonatomic, strong) IBOutlet UILabel *risetimeLabel;
@property (nonatomic, strong) PassEntity *pass;

@end
