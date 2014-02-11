//
//  REFNewInspectionViewController.m
//  Resurfacing
//
//  Created by Prime on 2/1/14.
//  Copyright (c) 2014 Prime. All rights reserved.
//

#import "REFNewInspectionViewController.h"
#import "REFShowMapViewController.h"




@interface REFNewInspectionViewController ()
{
    UIPickerView *profilePickerView;
    NSMutableArray *pickerDataArray;
    NSInteger pickerTag;
    UIPopoverController *popoverController;
    MBProgressHUD *HUD;
    NSString *latitude;
    NSString *longitude;
    NSString *latituteFrom;
    NSString *longitudeFrom;
    NSString *latituteTo;
    NSString *longitudeTo;
    NSString *distanceReceived;
    
    
}
@property (nonatomic, strong) CLGeocoder *geocoder;
@end

@implementation REFNewInspectionViewController
MKRoute *route;

CLPlacemark *thePlacemark;


@synthesize datePicker;
//@synthesize mapview;

@synthesize txtConnectingStreet1,txtConnectingStreet2,txtConnectingStreet3,txtConnectingStreet4,txtConnectingStreet5,txtConnectingStreet6,txtConnectingStreet7,txtFinishStation,txtImprovements,txtInspecDate,txtInspectionId,txtInspectorName,txtLimitFrom,txtLimitTo,txtPavLength,txtPavWidth,txtStartStation,txtStreet,txtZone;
@synthesize txtStreet1Direction,txtStreet2Direction,txtStreet3Direction,txtStreet4Direction,txtStreet5Direction,txtStreet6Direction,txtStreet7Direction;

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
    
    //self.mapview.delegate = self;
	// Do any additional setup after loading the view.
}


-(void)createDatePicker:(UITextField *)txtField{
    
    UIToolbar *pickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 300, 44)];
    pickerToolbar.barStyle = UIBarStyleBlackOpaque;
    [pickerToolbar sizeToFit];
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(selectionDone)];
    [barItems addObject:doneBtn];
    
    [pickerToolbar setItems:barItems animated:YES];
    
    
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 44, 320, 300)];
    
    //distancePickerView.dataSource = self;
    
        datePicker.datePickerMode = UIDatePickerModeDate;
        datePicker.hidden = NO;
        datePicker.date = [NSDate date];
        pickerTag=1;
        
        
    
    
    [datePicker addTarget:self
                   action:@selector(TextChange:)
         forControlEvents:UIControlEventValueChanged];
    
    
    UIViewController* popoverContent = [[UIViewController alloc] init];
    UIView* popoverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 344)];
    popoverView.backgroundColor = [UIColor whiteColor];
    
    
    [popoverView addSubview:pickerToolbar];
    [popoverView addSubview:datePicker];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(320, 244);
    
    //create a popover controller
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    CGRect popoverRect;
   
        popoverRect = [self.view convertRect:[txtInspecDate frame]
                                    fromView:[txtInspecDate superview]];
   
    
    
    popoverRect.size.width = MIN(popoverRect.size.width, 100) ;
    popoverRect.origin.x  = popoverRect.origin.x;
    // popoverRect.size.height  = ;
    
    [popoverController
     presentPopoverFromRect:popoverRect
     inView:self.view
     permittedArrowDirections:UIPopoverArrowDirectionUp
     animated:YES];
    
    
    //release the popover content
    
    
}
-(void)createPicker:(UITextField *)txtField
{
    UIToolbar *pickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 300, 44)];
    pickerToolbar.barStyle = UIBarStyleBlackOpaque;
    [pickerToolbar sizeToFit];
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(selectionDone)];
    [barItems addObject:doneBtn];
    
    [pickerToolbar setItems:barItems animated:YES];
    
    
    profilePickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 44, 320, 300)];
    profilePickerView.delegate = self;
    //distancePickerView.dataSource = self;
    
    
    
    profilePickerView.showsSelectionIndicator = YES;
    
    
    UIViewController* popoverContent = [[UIViewController alloc] init];
    UIView* popoverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 344)];
    popoverView.backgroundColor = [UIColor whiteColor];
    
    
    [popoverView addSubview:pickerToolbar];
    [popoverView addSubview:profilePickerView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(320, 244);
    
    //create a popover controller
    popoverController = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    CGRect popoverRect = [self.view convertRect:[txtField frame]
                                       fromView:[txtField superview]];
    
    popoverRect.size.width = MIN(popoverRect.size.width, 100) ;
    popoverRect.origin.x  = popoverRect.origin.x;
    // popoverRect.size.height  = ;
    
    [popoverController
     presentPopoverFromRect:popoverRect
     inView:self.view
     permittedArrowDirections:UIPopoverArrowDirectionAny
     animated:YES];
    
    
}

-(void)selectionDone
{
    [popoverController dismissPopoverAnimated:YES];
}
- (void)TextChange:(id)sender{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    
    if(pickerTag==1)
    {
        [df setDateFormat:@"yyyy-MM-dd"];
        txtInspecDate.text=[df stringFromDate:datePicker.date];
    }
    
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    switch (textField.tag) {
        case 1:
            [textField resignFirstResponder];
            [self createDatePicker:txtInspecDate];
            pickerTag=1;
            break;
        case 2:
            [textField resignFirstResponder];
            [self showMap];
            pickerTag=2;
            break;
        case 3:
            [textField resignFirstResponder];
            [self showMap];
            pickerTag=3;
            break;
        case 4:
            [textField resignFirstResponder];
            [self showMap];
            pickerTag=4;
            break;
        case 5:
            [textField resignFirstResponder];
            [self showMap];
            pickerTag=5;
            break;
        case 6:
            [textField resignFirstResponder];
            [self showMap];
            pickerTag=6;
            break;
        case 7:
            [textField resignFirstResponder];
            [self showMap];
            pickerTag=7;
            break;
        case 8:
            [textField resignFirstResponder];
            [self showMap];
            pickerTag=8;
            break;
        case 9:
            [textField resignFirstResponder];
            [self showMap];
            pickerTag=9;
            break;
        case 10:
            [textField resignFirstResponder];
            [self showMap];
            pickerTag=10;
            break;
        case 11:
            [textField resignFirstResponder];
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"North",@"South",@"East",@"West",nil];
            [self createPicker:txtStreet1Direction];
            pickerTag=11;
            break;
        case 12:
            [textField resignFirstResponder];
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"North",@"South",@"East",@"West",nil];
            [self createPicker:txtStreet2Direction];
            pickerTag=12;
            break;
        case 13:
            [textField resignFirstResponder];
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"North",@"South",@"East",@"West",nil];
            [self createPicker:txtStreet3Direction];
            pickerTag=13;
            break;
        case 14:
            [textField resignFirstResponder];
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"North",@"South",@"East",@"West",nil];
            [self createPicker:txtStreet4Direction];
            pickerTag=14;
            break;
        case 15:
            [textField resignFirstResponder];
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"North",@"South",@"East",@"West",nil];
            [self createPicker:txtStreet5Direction];
            pickerTag=15;
            break;
        case 16:
            [textField resignFirstResponder];
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"North",@"South",@"East",@"West",nil];
            [self createPicker:txtStreet6Direction];
            pickerTag=16;
            break;
        case 17:
            [textField resignFirstResponder];
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"North",@"South",@"East",@"West",nil];
            [self createPicker:txtStreet7Direction];
            pickerTag=17;
            break;

            
        default:
            break;
    }
   }

-(void)showMap
{
    REFShowMapViewController *selectLocationViewController;
    
    selectLocationViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SelectLocation"];
    
    selectLocationViewController.delegate=self;
    [self presentViewController:selectLocationViewController animated:YES completion:nil];

}

- (IBAction)selectLocationFromMap:(id)sender {
    [self showMap];
}


-(void)didReceiveLatitude:(NSString *)latitudevalue longitudeValue:(NSString *)longitudevalue distance:(NSString *)distance{
    NSLog(@"selected location %@ %@", latitudevalue, longitudevalue);
    distanceReceived=distance;
    latitude = latitudevalue;
    longitude = longitudevalue;
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.navigationController.view addSubview:HUD];
    
    HUD.labelText=@"";
    HUD.dimBackground = YES;
    HUD.delegate = self;
    [HUD show:YES];
    
    
    [self locationDetails:latitude longitudeVal:longitude];
}



-(void)locationDetails:(NSString*)latitudecode longitudeVal:(NSString*)longitudecode{
    CLLocationCoordinate2D cordinates;
    cordinates.latitude = [latitudecode floatValue];
    cordinates.longitude = [longitudecode floatValue];
    
    CLLocation *location = [[CLLocation alloc] initWithCoordinate:cordinates altitude:1 horizontalAccuracy:1 verticalAccuracy:-1 timestamp:nil];
    
    _geocoder = [[CLGeocoder alloc] init];
    
    [self.geocoder reverseGeocodeLocation: location completionHandler:
     ^(NSArray *placemarks, NSError *error) {
         
         if (error) {
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!"
                                                             message:@"Cannot determined the address"
                                                            delegate:nil
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil];
             
             [alert show];
             
         }
         else
         {
             
             //Get address
             CLPlacemark *placemark = [placemarks objectAtIndex:0];
             
             NSLog(@"Placemark array: %@",placemark.addressDictionary );
             
             //String to address
             NSString *locatedaddress = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
             
             //Print the location in the console
             NSLog(@"Currently address is: %@",locatedaddress);
            // lblLocationDetails.text = locatedaddress;
             switch (pickerTag) {
               
                 case 2:
                     txtLimitFrom.text=locatedaddress;
                     latituteFrom=latitude;
                     longitudeFrom=longitude;
                     break;
                 case 3:
                 {
                     txtLimitTo.text=locatedaddress;
                     latituteTo=latitude;
                     longitudeTo=longitude;
                     if(latituteFrom.length!=0 && longitudeFrom.length!=0 && latituteTo.length!=0 && longitudeTo.length!=0)
                     {
                     CLLocation *pointFrom=[[CLLocation alloc]initWithLatitude:latituteFrom.doubleValue longitude:longitudeFrom.doubleValue];
                     CLLocation *pointTo=[[CLLocation alloc]initWithLatitude:latituteTo.doubleValue longitude:longitudeTo.doubleValue];
                     CLLocationDistance distance=[pointFrom distanceFromLocation:pointTo];
                         
                     //txtPavLength.text=[NSString stringWithFormat:@"%2.0f m",distance];
                         
                         
                        txtPavLength.text=distanceReceived;
                         
                         
                         
                         
                         
                         
                         
                         
                     }
                     
                 }
                     break;
                 case 4:
                     txtConnectingStreet1.text=locatedaddress;
                     break;
                 case 5:
                     txtConnectingStreet2.text=locatedaddress;
                     break;
                 case 6:
                     txtConnectingStreet3.text=locatedaddress;
                     break;
                 case 7:
                     txtConnectingStreet4.text=locatedaddress;
                     break;
                 case 8:
                     txtConnectingStreet5.text=locatedaddress;
                     break;
                 case 9:
                     txtConnectingStreet6.text=locatedaddress;
                     break;
                 case 10:
                     txtConnectingStreet7.text=locatedaddress;
                     break;
                     
                 default:
                     break;
             }

         }
         
         
     }];
    [HUD setHidden:YES];
}

#pragma mark-
#pragma UIPickerView Delegate Methods
#pragma mark-
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    
    return pickerDataArray.count;
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    // [fromButton setText:[NSString stringWithFormat:@"%@",[array_from objectAtIndex:[pickerView selectedRowInComponent:0]]]];
    switch (pickerTag) {
        case 1:
            txtInspecDate.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 11:
            txtStreet1Direction.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 12:
            txtStreet2Direction.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 13:
            txtStreet3Direction.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 14:
            txtStreet4Direction.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 15:
            txtStreet5Direction.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 16:
            txtStreet6Direction.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 17:
            txtStreet7Direction.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;

            
        default:
            break;
    }
    
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [pickerDataArray objectAtIndex:row];
}


// tell the picker the width of each row for a given component
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    CGFloat componentWidth = 0.0;
	componentWidth = 320.0;
	
	return componentWidth;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
