//
//  REFDashboardViewController.m
//  Resurfacing
//
//  Created by Prime on 2/2/14.
//  Copyright (c) 2014 Prime. All rights reserved.
//

#import "REFDashboardViewController.h"
#import "DashboardContentCell.h"
#import "DashboardHeaderCell.h"
#import "REFLoginViewController.h"
#import "REFReportViewController.h"

@interface REFDashboardViewController ()
{
     NSMutableArray *dashboardDataArray;
}

@end

@implementation REFDashboardViewController
@synthesize tblView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIBarButtonItem *btnLogout = [[UIBarButtonItem alloc]
                                  initWithTitle:@"Logout" style:UIBarButtonItemStylePlain  target:self
                                  action:@selector(logout)];
    self.navigationItem.leftBarButtonItem=btnLogout;
    dashboardDataArray=[[NSMutableArray alloc]init];
    NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] init];
    dataDictionary=[NSMutableDictionary dictionaryWithObjectsAndKeys:
                    @"001", @"ID",
                    @"Prime User1", @"insName",
                    @"Zone1", @"zone",
                    @"2014-01-31", @"date",
                    @"Street1", @"street",
                    nil];
    
    NSMutableDictionary *dataDictionary2 = [[NSMutableDictionary alloc] init];
    dataDictionary2=[NSMutableDictionary dictionaryWithObjectsAndKeys:
                     @"002", @"ID",
                     @"Prime User2", @"insName",
                     @"Zone2", @"zone",
                     @"2014-02-01", @"date",
                     @"Street2", @"street",
                     nil];
    [dashboardDataArray addObject:dataDictionary];
    [dashboardDataArray addObject:dataDictionary2];
    [self.tblView reloadData];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dashboardDataArray count] +1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([dashboardDataArray count] == 0) {
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        cell.textLabel.text = @"No records to display";
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        cell.textLabel.textColor=[UIColor lightGrayColor];
        //whatever else to configure your one cell you're going to return
        return cell;
    }
    else
    {
        
        
        if(indexPath.row==0)
        {
            static NSString *simpleTableIdentifier = @"DashboardHeaderCell";
            
            DashboardHeaderCell *cell = (DashboardHeaderCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
            if (cell == nil)
            {
                NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DashboardHeaderCell" owner:self options:nil];
                cell = [nib objectAtIndex:0];
            }
            
            //cell.nameLabel.text = [tableData objectAtIndex:indexPath.row];
            //cell.thumbnailImageView.image = [UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];
            //cell.prepTimeLabel.text = [prepTime objectAtIndex:indexPath.row];
            
            return cell;
        }
        else
        {
            
            static NSString *simpleTableIdentifier = @"DashboardContentCell";
            
            DashboardContentCell *cell = (DashboardContentCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
            if (cell == nil)
            {
                NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DashboardContentCell" owner:self options:nil];
                cell = [nib objectAtIndex:0];
            }
            
            cell.lblID.text = [[dashboardDataArray objectAtIndex:indexPath.row-1]valueForKey:@"ID"];
            cell.lblInspectBy.text = [[dashboardDataArray objectAtIndex:indexPath.row-1]valueForKey:@"insName"];
            cell.lblZone.text = [[dashboardDataArray objectAtIndex:indexPath.row-1]valueForKey:@"zone"];
            cell.lblDate.text =[[dashboardDataArray objectAtIndex:indexPath.row-1]valueForKey:@"date"];
            cell.lblStreet.text =[[dashboardDataArray objectAtIndex:indexPath.row-1]valueForKey:@"street"];
            return cell;
            
        }
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    REFReportViewController *nextView= [[REFReportViewController alloc]initWithNibName:@"REFReportViewController" bundle:nil];
    [self.navigationController pushViewController:nextView animated:YES];

    }
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0)
    {
        return 47;
    }
    else
    {
        return 67;
    }
}
-(void)logout
{
    REFLoginViewController *loginViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginView"];    
    for (UIViewController* viewController in self.navigationController.viewControllers) {
        
        if ([viewController isKindOfClass:[loginViewController class]] ) {
            
            REFLoginViewController *loginController = (REFLoginViewController*)viewController;
            
            [self.navigationController popToViewController:loginController animated:YES];
        }
    }
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
