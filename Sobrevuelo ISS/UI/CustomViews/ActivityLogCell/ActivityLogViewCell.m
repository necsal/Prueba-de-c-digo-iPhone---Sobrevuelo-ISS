//
//  ActivityLogViewCell.m
//  elparking
//
//  Created by Alvaro Hernández Ojeda on 12/9/16.
//  Copyright © 2016 El Parking Internet S.L. All rights reserved.
//

#import "ActivityLogViewCell.h"

@interface ActivityLogViewCell () {
    //ActivityLogViewModel *_activityLogViewModel;
}

@end

@implementation ActivityLogViewCell

+ (UINib *)nib {
    return [UINib nibWithNibName:@"ActivityLogCell" bundle:nil];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    _viewTopLine.hidden = NO;
    _viewBottomLine.hidden = NO;
}

/*- (void)configureWithActivityLogViewModel:(ActivityLogViewModel *)activityLogViewModel cellPosition:(cellPosition)cellPosition {
    _activityLogViewModel = activityLogViewModel;
    _lblTitle.text = activityLogViewModel.title;
    _lblSubtitle.text = activityLogViewModel.subtitle;
    _lblDetail.text = activityLogViewModel.detail;
    _lblTimeTable.text = activityLogViewModel.timeTable;

    if (cellPosition == cellPositionUnique) {
        _viewTopLine.hidden = YES;
        _viewBottomLine.hidden = YES;
    } else if (cellPosition == cellPositionFirst) {
        _viewTopLine.hidden = YES;
    } else if (cellPosition == cellPositionLast) {
        _viewBottomLine.hidden = YES;
    }
}*/

@end
