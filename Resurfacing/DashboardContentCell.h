//
//  DashboardContentCell.h
//  Resurfacing
//
//  Created by Prime on 2/2/14.
//  Copyright (c) 2014 Prime. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DashboardContentCell : UITableViewCell
@property(nonatomic,retain)IBOutlet UILabel *lblID;
@property(nonatomic,retain)IBOutlet UILabel *lblInspectBy;
@property(nonatomic,retain)IBOutlet UILabel *lblZone;
@property(nonatomic,retain)IBOutlet UILabel *lblDate;
@property(nonatomic,retain)IBOutlet UILabel *lblStreet;

@end
