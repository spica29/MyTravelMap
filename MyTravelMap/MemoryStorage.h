//
//  MemoryStorage.h
//  MyTravelMap
//
//  Created by Academy387 on 11/12/14.
//  Copyright (c) 2014 neZnam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MemoryStorage : NSObject


@property NSString *someProperty;
@property NSMutableArray *listTravelsArray;

+(id)sharedManager;

@end