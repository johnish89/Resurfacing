//
//  REFNewInspection2ViewController.m
//  Resurfacing
//
//  Created by Prime on 2/2/14.
//  Copyright (c) 2014 Prime. All rights reserved.
//

#import "REFNewInspection2ViewController.h"
#import "REFShowMapViewController.h"

@interface REFNewInspection2ViewController ()
{
    UIPickerView *profilePickerView;
    NSMutableArray *pickerDataArray;
    NSInteger pickerTag;
    UIPopoverController *popoverController;
    MBProgressHUD *HUD;
    NSString *latitude;
    NSString *longitude;


}
@property (nonatomic, strong) CLGeocoder *geocoder;
@end

@implementation REFNewInspection2ViewController
@synthesize txtConnectingStreet14,txtConnectingStreet10,txtConnectingStreet11,txtConnectingStreet12,txtConnectingStreet13,txtConnectingStreet15,txtConnectingStreet16,txtConnectingStreet17,txtConnectingStreet8,txtConnectingStreet9,txtInstructionsDerection1,txtInstructionsDerection2,txtInstructionsDerection3,txtInstructionsDerection4,txtStreet10Direction,txtStreet11Direction,txtStreet12Direction,txtStreet13Direction,txtStreet14Direction,txtStreet15Direction,txtStreet16Direction,txtStreet17Direction,txtStreet8Direction,txtStreet9Direction;

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
     permittedArrowDirections:UIPopoverArrowDirectionUp
     animated:YES];
    
    
}

-(void)selectionDone
{
    [popoverController dismissPopoverAnimated:YES];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    switch (textField.tag) {
        case 1:
            [self showMap];
            pickerTag=1;
            break;
        case 2:
            [self showMap];
            pickerTag=2;
            break;
        case 3:
            [self showMap];
            pickerTag=3;
            break;
        case 4:
            [self showMap];
            pickerTag=4;
            break;
        case 5:
            [self showMap];
            pickerTag=5;
            break;
        case 6:
            [self showMap];
            pickerTag=6;
            break;
        case 7:
            [self showMap];
            pickerTag=7;
            break;
        case 8:
            [self showMap];
            pickerTag=8;
            break;
        case 9:
            [self showMap];
            pickerTag=9;
            break;
        case 10:
            [self showMap];
            pickerTag=10;
            break;
        case 11:
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"North",@"South",@"East",@"West",nil];
            [self createPicker:txtStreet8Direction];
            pickerTag=11;
            break;
        case 12:
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"North",@"South",@"East",@"West",nil];
            [self createPicker:txtStreet9Direction];
            pickerTag=12;
            break;
        case 13:
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"North",@"South",@"East",@"West",nil];
            [self createPicker:txtStreet10Direction];
            pickerTag=13;
            break;
        case 14:
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"North",@"South",@"East",@"West",nil];
            [self createPicker:txtStreet11Direction];
            pickerTag=14;
            break;
        case 15:
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"North",@"South",@"East",@"West",nil];
            [self createPicker:txtStreet12Direction];
            pickerTag=15;
            break;
        case 16:
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"North",@"South",@"East",@"West",nil];
            [self createPicker:txtStreet13Direction];
            pickerTag=16;
            break;
        case 17:
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"North",@"South",@"East",@"West",nil];
            [self createPicker:txtStreet14Direction];
            pickerTag=17;
            break;
        case 18:
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"North",@"South",@"East",@"West",nil];
            [self createPicker:txtStreet15Direction];
            pickerTag=18;
            break;
        case 19:
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"North",@"South",@"East",@"West",nil];
            [self createPicker:txtStreet16Direction];
            pickerTag=19;
            break;
        case 20:
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"North",@"South",@"East",@"West",nil];
            [self createPicker:txtStreet17Direction];
            pickerTag=20;
            break;
        case 21:
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"North",@"South",@"East",@"West",nil];
            [self createPicker:txtInstructionsDerection1];
            pickerTag=21;
            break;
        case 22:
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"North",@"South",@"East",@"West",nil];
            [self createPicker:txtInstructionsDerection2];
            pickerTag=22;
            break;
        case 23:
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"North",@"South",@"East",@"West",nil];
            [self createPicker:txtInstructionsDerection3];
            pickerTag=23;
            break;
        case 24:
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"North",@"South",@"East",@"West",nil];
            [self createPicker:txtInstructionsDerection4];
            pickerTag=24;
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


-(void)didReceiveLatitude:(NSString *)latitudevalue longitudeValue:(NSString *)longitudevalue{
    NSLog(@"selected location %@ %@", latitudevalue, longitudevalue);
    
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
                     
                 case 1:
                     txtConnectingStreet8.text=locatedaddress;
                     break;
                 case 2:
                     txtConnectingStreet9.text=locatedaddress;
                    break;
                 case 3:
                     txtConnectingStreet10.text=locatedaddress;
                     break;
                 case 4:
                     txtConnectingStreet11.text=locatedaddress;
                     break;
                 case 5:
                     txtConnectingStreet12.text=locatedaddress;
                     break;
                 case 6:
                     txtConnectingStreet13.text=locatedaddress;
                     break;
                 case 7:
                     txtConnectingStreet14.text=locatedaddress;
                     break;
                 case 8:
                     txtConnectingStreet15.text=locatedaddress;
                     break;
                 case 9:
                     txtConnectingStreet16.text=locatedaddress;
                     break;
                 case 10:
                     txtConnectingStreet17.text=locatedaddress;
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

    switch (pickerTag) {
        case 11:
            txtStreet8Direction.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 12:
            txtStreet9Direction.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 13:
            txtStreet10Direction.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 14:
            txtStreet11Direction.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 15:
            txtStreet12Direction.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 16:
            txtStreet13Direction.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 17:
            txtStreet14Direction.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 18:
            txtStreet15Direction.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 19:
            txtStreet16Direction.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 20:
            txtStreet17Direction.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 21:
            txtInstructionsDerection1.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 22:
            txtInstructionsDerection2.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 23:
            txtInstructionsDerection3.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 24:
            txtInstructionsDerection4.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
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
