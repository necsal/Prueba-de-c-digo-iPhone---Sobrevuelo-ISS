//
//  ActivityLogViewCell.h
//  elparking
//
//  Created by Alvaro Hernández Ojeda on 12/9/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const cellIdentifier = @"ActivityLogCell";

@interface ActivityLogViewCell : UITableViewCell {
    __weak IBOutlet UILabel *_lblTimeTable;
    __weak IBOutlet UILabel *_lblTitle;
    __weak IBOutlet UILabel *_lblSubtitle;
    __weak IBOutlet UILabel *_lblDetail;
    __weak IBOutlet NSLayoutConstraint *_ctLastCellInSectionBottom;
    __weak IBOutlet UIView *_viewTopLine;
    __weak IBOutlet UIView *_viewBottomLine;
}

typedef enum { cellPositionUnique = 0, cellPositionFirst, cellPositionLast, cellPositionMiddle } cellPosition;

+ (UINib *)nib;

//- (void)configureWithOverflightViewModel:(OverflightViewModel *)overflightViewModel cellPosition:(cellPosition)cellPosition;

@end
