//
//  Travel.m
//  MyTravelMap
//
//  Created by Academy387 on 12/8/14.
//  Copyright (c) 2014 neZnam. All rights reserved.
//

#import "Travel.h"
#import "MemoryStorage.h"

@implementation Travel


- (NSString *)fullDetails
{

    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd MM yyyy"];
    NSString *stringFromDate = [formatter stringFromDate:self.date];
    NSString *fullDetails;
    if(self.numDays==1){
        fullDetails=[[NSString alloc] initWithFormat:@"Destination: %@\nRating: %ld/5\nExperience: %@\nTravel date: %@\nSprend %ld day", self.destination ,(long)self.rating ,self.experience, stringFromDate, (long)self.numDays];}
    
    else  {
        fullDetails=[[NSString alloc] initWithFormat:@"Destination: %@\nRating: %ld/5\nExperience: %@\nTravel date: %@\nSprend %ld days", self.destination ,(long)self.rating ,self.experience, stringFromDate, (long)self.numDays];
    }
    
    return fullDetails;

}



@end