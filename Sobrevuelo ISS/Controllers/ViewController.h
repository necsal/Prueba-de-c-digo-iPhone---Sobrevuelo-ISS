//
//  ViewController.h
//  Sobrevuelo ISS
//
//  Created by Álvaro Hernández Ojeda on 14/12/15.
//  Copyright © 2015 Álvaro Hernández Ojeda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *estasEn;
@property (weak, nonatomic) IBOutlet UIView *deatilsView;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@end

