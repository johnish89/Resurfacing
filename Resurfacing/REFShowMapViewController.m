//
//  REFShowMapViewController.m
//  Resurfacing
//
//  Created by Prime on 2/2/14.
//  Copyright (c) 2014 Prime. All rights reserved.
//

#import "REFShowMapViewController.h"
#import "REFNewInspectionViewController.h"
#import <GoogleMaps/GoogleMaps.h>


#define METERS_PER_MILE 1609.344

@interface REFShowMapViewController ()
{
    
    
   GMSMapView *mapView_;

    CLLocationCoordinate2D coordinate;
   // MBProgressHUD *HUD;
    NSString *distance;

}

@end

@implementation REFShowMapViewController
CLPlacemark *thePlacemark;
MKRoute *routeDetails;


@synthesize toolBar;
@synthesize sLatitude,sLongitude;
@synthesize locationManager;
@synthesize delegate=_delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)closeSelectMap {
    
    [_delegate didReceiveLatitude:sLatitude longitudeValue:sLongitude distance:distance];
    [self dismissViewControllerAnimated:YES completion:nil];
    

    
}

- (void)doneSelection {
    NSLog(@"latitude  %@ longitude %@",sLatitude,sLongitude);
    
    MKDirectionsRequest *directionsRequest = [[MKDirectionsRequest alloc] init];
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithPlacemark:thePlacemark];
    [directionsRequest setSource:[MKMapItem mapItemForCurrentLocation]];
    [directionsRequest setDestination:[[MKMapItem alloc] initWithPlacemark:placemark]];
    directionsRequest.transportType = MKDirectionsTransportTypeAutomobile;
    MKDirections *directions = [[MKDirections alloc] initWithRequest:directionsRequest];
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error %@", error.description);
        } else {
            routeDetails = response.routes.lastObject;
            [self.mapview addOverlay:routeDetails.polyline];
            //self.destinationLabel.text = [placemark.addressDictionary objectForKey:@"Street"];
            distance = [NSString stringWithFormat:@"%0.1f Miles", routeDetails.distance/1609.344];
            //self.transportLabel.text = [NSString stringWithFormat:@"%u" ,routeDetails.transportType];
            //self.allSteps = @"";
//            for (int i = 0; i < routeDetails.steps.count; i++) {
//                MKRouteStep *step = [routeDetails.steps objectAtIndex:i];
//                NSString *newStep = step.instructions;
//                self.allSteps = [self.allSteps stringByAppendingString:newStep];
//                self.allSteps = [self.allSteps stringByAppendingString:@"\n\n"];
//                self.steps.text = self.allSteps;
//            }
        }
    }];
    
    
    
    [_delegate didReceiveLatitude:sLatitude longitudeValue:sLongitude distance:distance];
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
	// Do any additional setup after loading the view.
    [self createToolbar];
    
    
    if([sLatitude isEqualToString:@""]|| [sLongitude isEqualToString:@""] || sLatitude== NULL || sLongitude==NULL)
    {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        
        
        [self.locationManager startUpdatingLocation];
        
        NSLog(@"start Update Location");
    }
    else
    {
        NSLog(@"Get Data from the previous View");
        
        
        float  latitudeValues = [sLatitude floatValue];
        float  langitudeValues = [sLongitude floatValue];
        
        CLLocationCoordinate2D newCoord = {latitudeValues, langitudeValues};
        
        
        //------------
        
        
        MKCoordinateRegion region;
        region.span.longitudeDelta = 0.010027;
        region.span.latitudeDelta = 0.010074;
        region.center.latitude = newCoord.latitude;
        region.center.longitude = newCoord.longitude;
        [_mapview setRegion:region animated:YES];
        
        //---------
        
        MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
        point.coordinate = newCoord;
        
        
        [self.mapview addAnnotation:point];
    }
    
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                         action:@selector(handleGesture:)];
    tgr.numberOfTapsRequired = 1;
    [_mapview addGestureRecognizer:tgr];

}

- (void)createToolbar {
    UIBarButtonItem *changeCategory = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(closeSelectMap)];
    UIBarButtonItem *difficultyExplanation = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(doneSelection)];
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    NSArray *buttonItems = [NSArray arrayWithObjects:changeCategory, difficultyExplanation, spacer, nil];
    [toolBar setItems:buttonItems];
}

- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateEnded)
        return;
    
    CGPoint touchPoint = [gestureRecognizer locationInView:_mapview];
    coordinate = [_mapview convertPoint:touchPoint toCoordinateFromView:_mapview];
    
    NSLog(@"latitude  %f longitude %f",coordinate.latitude,coordinate.longitude);
    
    sLatitude = [[NSNumber numberWithFloat:coordinate.latitude] stringValue];
    sLongitude = [[NSNumber numberWithFloat:coordinate.longitude] stringValue];
    
    CGPoint point = [gestureRecognizer locationInView:self.mapview];
    CLLocationCoordinate2D locCoord = [self.mapview convertPoint:point toCoordinateFromView:self.mapview];
    // Then all you have to do is create the annotation and add it to the map
    [_mapview removeAnnotations:[_mapview annotations]];
    
    MKPointAnnotation *newAnnotation = [[MKPointAnnotation alloc] init];
    [newAnnotation setCoordinate:locCoord];
	[self.mapview addAnnotation:newAnnotation];
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    //[HUD show:YES];
    NSLog(@"StartingStartingStartingStartingStarting");
    CLLocationCoordinate2D zoomLocation = [newLocation coordinate];
    [self.locationManager stopUpdatingLocation];
    sLatitude = [NSString stringWithFormat:@"%f", newLocation.coordinate.latitude];
    sLongitude = [NSString stringWithFormat:@"%f", newLocation.coordinate.longitude];
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    
    // 3
    [_mapview setRegion:viewRegion animated:YES];
    [_mapview removeAnnotations:[_mapview annotations]];
    
    MKPointAnnotation *newAnnotation = [[MKPointAnnotation alloc] init];
    [newAnnotation setCoordinate:newLocation.coordinate];
	[self.mapview addAnnotation:newAnnotation];
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
