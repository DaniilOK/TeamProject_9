//
//  MapViewController.m
//  TP_lab8_2
//
//  Created by Admin on 27.05.17.
//  Copyright © 2017 Daniil Boyko. All rights reserved.
//

#import "MapViewController.h"
#import "Annotation.h"

@interface MapViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *myMapView;

@end


#define MINSK_LATITUDE 53.9;
#define MINSK_LONGITUDE 27.5667;

#define FIRST_LATITUDE 53.9;
#define FIRST_LONGITUDE 27.5667;

#define SECOND_LATITUDE 53.89;
#define SECOND_LONGITUDE 27.566;

#define THE_SPAN 0.10f;

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bgImage"]]];
    
    
    //Create the region
    MKCoordinateRegion myRegion;
    
    //Center
    CLLocationCoordinate2D center;
    center.latitude = MINSK_LATITUDE;
    center.longitude = MINSK_LONGITUDE;
    
    //Span
    MKCoordinateSpan span;
    span.latitudeDelta = THE_SPAN;
    span.longitudeDelta = THE_SPAN;
    
    myRegion.center = center;
    myRegion.span = span;
    
    //Set our mapView
    [_myMapView setRegion:myRegion animated:YES];
    
    //Annotation
    NSMutableArray * locations = [[NSMutableArray alloc] init];
    CLLocationCoordinate2D location;
    Annotation * myAnn;
    
    //Arsenal annotation
    myAnn = [[Annotation alloc] init];
    location.latitude = FIRST_LATITUDE;
    location.longitude = SECOND_LONGITUDE;
    myAnn.coordinate = location;
    myAnn.title = @"First bank";
    myAnn.subtitle = @"Som comment to first bank";
    [locations addObject:myAnn];
    
    myAnn = [[Annotation alloc] init];
    location.latitude = SECOND_LATITUDE;
    location.longitude = SECOND_LONGITUDE;
    myAnn.coordinate = location;
    myAnn.title = @"Second bank";
    myAnn.subtitle = @"Som comment to second bank";
    [locations addObject:myAnn];
    
    
    [self.myMapView addAnnotations:locations];
    //1. Create a coordinate for use with the annotation
    /*CLLocationCoordinate2D minskLocation;
    minskLocation.latitude = MINSK_LATITUDE;
    minskLocation.longitude = MINSK_LONGITUDE;
    
    Annotation * myAnnotation = [Annotation alloc];
    myAnnotation.coordinate = minskLocation;
    myAnnotation.title = @"Minsk";
    myAnnotation.subtitle = @"The conry fo belarus";
    
    
    [self.myMapView addAnnotation:myAnnotation];*/
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
    [self performSegueWithIdentifier:@"UserInterface" sender:self];
}


@end
