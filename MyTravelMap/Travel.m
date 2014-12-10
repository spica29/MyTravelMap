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
    [formatter setDateFormat:@"dd mm yyyy"];
    NSString *stringFromDate = [formatter stringFromDate:self.date];
    NSString *inStr = [NSString stringWithFormat: @"%ld", (long)self.rating];
    

    
    NSString *fullDetails=[[NSString alloc] initWithFormat:@"Destination: %@\nRating: %@/5\nExperience: %@\nTravel date: %@", self.destination,inStr ,self.description, stringFromDate];
    

    return fullDetails;

}



@end