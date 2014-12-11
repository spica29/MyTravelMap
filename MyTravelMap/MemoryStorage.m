//
//  MemoryStorage.m
//  MyTravelMap
//
//  Created by Academy387 on 11/12/14.
//  Copyright (c) 2014 neZnam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MemoryStorage.h"


@implementation MemoryStorage

+(id)sharedManager {
    static MemoryStorage *memoryStorage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        memoryStorage = [[self alloc] init];
    });
    return memoryStorage;
}

-(id)init {
    if (self = [super init]) {
        self.someProperty = @"Some String";
<<<<<<< HEAD
        self.listTravelsArray = [[NSMutableArray alloc] init];
    }
    return self;
    
=======
        self.array = [[NSMutableArray alloc] init];
    }
    return self;

>>>>>>> 7d833aae378cb885cac0222de9ee234ff9ed1778
}

@end