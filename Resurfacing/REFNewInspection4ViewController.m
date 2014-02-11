//
//  REFNewInspection4ViewController.m
//  Resurfacing
//
//  Created by Prime on 2/2/14.
//  Copyright (c) 2014 Prime. All rights reserved.
//

#import "REFNewInspection4ViewController.h"

@interface REFNewInspection4ViewController ()
{
    UIPickerView *profilePickerView;
    NSMutableArray *pickerDataArray;
    NSInteger pickerTag;
    UIPopoverController *popoverController;
}

@end

@implementation REFNewInspection4ViewController
@synthesize txtOnewayStatus1,txtOnewayStatus2,txtCotaRouteStatus1,txtCotaRouteStatus2,txtPavStatus1,txtPavStatus2,txtRPMStatus1,txtRPMStatus2,txtSideStatus1,txtSideStatus2;

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
     permittedArrowDirections:UIPopoverArrowDirectionAny
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
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"YES",@"NO",@"Not Applicable",nil];
            [self createPicker:txtOnewayStatus1];
            pickerTag=1;
            break;
        case 2:
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"YES",@"NO",@"Not Applicable",nil];
            [self createPicker:txtOnewayStatus2];
            pickerTag=2;
            break;
        case 3:
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"YES",@"NO",@"Not Applicable",nil];
            [self createPicker:txtCotaRouteStatus1];
            pickerTag=3;
            break;
        case 4:
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"YES",@"NO",@"Not Applicable",nil];
            [self createPicker:txtCotaRouteStatus2];
            pickerTag=4;
            break;
        case 5:
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"YES",@"NO",@"Not Applicable",nil];
            [self createPicker:txtPavStatus1];
            pickerTag=5;
            break;
        case 6:
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"YES",@"NO",@"Not Applicable",nil];
            [self createPicker:txtPavStatus2];
            pickerTag=6;
            break;
        case 7:
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"YES",@"NO",@"Not Applicable",nil];
            [self createPicker:txtRPMStatus1];
            pickerTag=7;
            break;
        case 8:
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"YES",@"NO",@"Not Applicable",nil];
            [self createPicker:txtRPMStatus2];
            pickerTag=8;
            break;
        case 9:
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"YES",@"NO",@"Not Applicable",nil];
            [self createPicker:txtSideStatus1];
            pickerTag=9;
            break;
        case 10:
            pickerDataArray=[[NSMutableArray alloc]initWithObjects:@"YES",@"NO",@"Not Applicable",nil];
            [self createPicker:txtSideStatus2];
            pickerTag=10;
            break;
            
            
        default:
            break;
    }
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
            txtOnewayStatus1.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 2:
            txtOnewayStatus2.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 3:
            txtCotaRouteStatus1.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 4:
            txtCotaRouteStatus2.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 5:
            txtPavStatus1.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 6:
            txtPavStatus2.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 7:
            txtRPMStatus1.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 8:
            txtRPMStatus2.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 9:
            txtSideStatus1.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
            break;
        case 10:
            txtSideStatus2.text=[pickerDataArray objectAtIndex:[pickerView selectedRowInComponent:0]];
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
