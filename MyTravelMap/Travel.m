//
//  Travel.m
//  MyTravelMap
//
//  Created by Academy387 on 12/8/14.
//  Copyright (c) 2014 neZnam. All rights reserved.
//

#import "Travel.h"

@implementation Travel


- (NSString *)fullDetails
{

    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd MM yyyy"];
    NSString *stringFromDate = [formatter stringFromDate:self.date];
    

    NSString *fullDetails=[[NSString alloc] initWithFormat:@"Destination: %@\nRating: %ld/5\nExperience: %@\nTravel date: %@", self.destination ,(long)self.rating ,self.experience, stringFromDate];
    

    return fullDetails;

}



@end