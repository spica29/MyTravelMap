//
//  ViewController.m
//  MyTravelMap
//
//  Created by Academy387 on 12/8/14.
//  Copyright (c) 2014 neZnam. All rights reserved.
//

#import "ViewController.h"
#import "City.h"
#import "MemoryStorage.h"
#import "Travel.h"
#import <GoogleMaps/GoogleMaps.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet GMSMapView *mapView;
@property (copy, nonatomic) NSSet *markers;
@property MemoryStorage *TravelsMemory;
//@property NSMutableArray *markersArray;

@end

@implementation ViewController{
    GMSMapView *mapView_;
    NSMutableArray *markersArray;
    
}

- (void)drawMarkers {
    for(GMSMarker *marker in self.markers) {
        marker.map = self.mapView;
    }
}

- (void)viewDidLoad {

    
    [self drawMarkers];
    _TravelsMemory = [MemoryStorage sharedManager];
    [super viewDidLoad];
markersArray = [[NSMutableArray alloc] init];
    //NSLog(@"latitude: %f longitude: %f", latitude, longitude);
    //addressCoordinate = CLLocationCoordinate2DMake((CLLocationDegrees)[[latArray objectAtIndex:indexPath.row] doubleValue],(CLLocationDegrees)[[longArray objectAtIndex:indexPath.row] doubleValue]);
    [self mapa];
}

//https://maps.googleapis.com/maps/api/place/autocomplete/output?parameters autocomplete

-(void)mapa {
    // Create a GMSCameraPosition that tells the map to display the
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude: 0
                                                            longitude: 0
                                                                 zoom:5];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    mapView_.mapType = kGMSTypeNormal;//mijenjati tipove mape
    mapView_.mapType = kGMSTypeTerrain;
    mapView_.mapType = kGMSTypeHybrid;
    self.mapView = mapView_;
    
    

    for(int i = 0; i < [_TravelsMemory.listTravelsArray count]; i++)
    {
        GMSMarker *marker = [[GMSMarker alloc] init];
        Travel *travel = [_TravelsMemory.listTravelsArray objectAtIndex:i];
        marker.position = CLLocationCoordinate2DMake(travel.city.latitude, travel.city.longitude);
        marker.title = travel.city.name;
        marker.map = _mapView;
        
        [markersArray addObject:marker];
    //   [markersArray release];
    }
    [NSSet setWithObjects:markersArray, nil];
    [self drawMarkers];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
