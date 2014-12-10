//
//  ViewController.m
//  MyTravelMap
//
//  Created by Academy387 on 12/8/14.
//  Copyright (c) 2014 neZnam. All rights reserved.
//

#import "ViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface ViewController ()

@end

@implementation ViewController{
    GMSMapView *mapView_;
    CLLocationDegrees latitude;
    CLLocationDegrees longitude;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    latitude = 0;
    longitude = 0;
    // Do any additional setup after loading the view, typically from a nib.
    
    // API za koordinate zadanog grada
    NSString* city = @"Zurich";
    NSString* serverPath = [[NSString alloc] initWithFormat:@("https://maps.googleapis.com/maps/api/geocode/json?address=%@&key=AIzaSyCbQwlpEl2MRB-il9MljyU5wCcR8fOXEfQ"), city];
    NSURL* serverUrl = [[NSURL alloc] initWithString:serverPath];
    
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:serverUrl];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                               latitude = [[[[[[responseDict valueForKey:@"results"] valueForKey:@"geometry"] valueForKey:@"location"]valueForKey:@"lat" ] objectAtIndex:0] doubleValue];
                               longitude = [[[[[[responseDict valueForKey:@"results"] valueForKey:@"geometry"] valueForKey:@"location"]valueForKey:@"lng" ] objectAtIndex:0] doubleValue];
                               [self mapa];
                           }];
    
    //NSLog(@"latitude: %f longitude: %f", latitude, longitude);
    //addressCoordinate = CLLocationCoordinate2DMake((CLLocationDegrees)[[latArray objectAtIndex:indexPath.row] doubleValue],(CLLocationDegrees)[[longArray objectAtIndex:indexPath.row] doubleValue]);
    
}

//https://maps.googleapis.com/maps/api/place/autocomplete/output?parameters autocomplete

-(void)mapa {
    // Create a GMSCameraPosition that tells the map to display the
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude: latitude
                                                            longitude: longitude
                                                                 zoom:5];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    mapView_.mapType = kGMSTypeNormal;//mijenjati tipove mape
    mapView_.mapType = kGMSTypeTerrain;
    mapView_.mapType = kGMSTypeHybrid;
    self.view = mapView_;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(latitude, longitude);
    //marker.title = @"Sydney";
    //marker.snippet = @"Australia";
    marker.map = mapView_;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
