//
//  REFShowMapViewController.h
//  Resurfacing
//
//  Created by Prime on 2/2/14.
//  Copyright (c) 2014 Prime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MBProgressHUD.h"

@protocol ModalSelectLocationViewDelegate;

@interface REFShowMapViewController : UIViewController<CLLocationManagerDelegate,MBProgressHUDDelegate>{
    id<ModalSelectLocationViewDelegate> delegate;
}
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
@property (weak, nonatomic) IBOutlet MKMapView *mapview;
@property (nonatomic, assign) id<ModalSelectLocationViewDelegate> delegate;
@property(nonatomic,retain) NSString *sLatitude, *sLongitude;
@property(nonatomic,retain)CLLocationManager *locationManager;


@end
