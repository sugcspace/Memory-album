//
//  MADataManager.m
//  Memory album
//
//  Created by sugc on 16/3/1.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "MADataManager.h"
#import "MAContext.h"

@interface MADataManager ()

@end

@implementation MADataManager

- (instancetype)sharedDataManager{
    static MADataManager *sharedDataManager = nil;
    static dispatch_once_t dataManagerToken;
    
    dispatch_once(&dataManagerToken, ^{
        sharedDataManager = [[MADataManager alloc] init];
    });
    return sharedDataManager;
}

- (NSArray *)localImage{
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    ALAssetsGroup *group = [[MAContext sharedContext] sharedAssetsGroup];
    [group enumerateAssetsUsingBlock:^(ALAsset *result,NSUInteger index, BOOL *stop){
        [array addObject:result];
    }];
    
    return array;
}


@end