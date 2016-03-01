//
//  MAAlbumViewDataManager.m
//  Memory album
//
//  Created by sugc on 16/3/1.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "MAAlbumViewDataManager.h"
#import "MADataManager.h"


@interface MAAlbumViewDataManager ()

@property (nonatomic, strong) MADataManager *manager;
@property (nonatomic, strong,readwrite) NSMutableArray *photoArray;

@end


@implementation MAAlbumViewDataManager

- (instancetype)init{
    self = [super init];
    if (self) {
        self.manager = [MADataManager sharedDataManager];
        self.photoArray = [[NSMutableArray alloc] init];
    }
    [self refreshData];
    return self;
}

- (void)refreshData{
    NSMutableArray *tmpArray = [[_manager localImage] mutableCopy];
    tmpArray = [self sortArrayByTime:tmpArray];
    
    for (int i = 0; i < tmpArray.count; i ++) {
        ALAsset *asset = [tmpArray objectAtIndex:i];
    }
    
}

- (NSMutableArray *)sortArrayByTime:(NSMutableArray *)array{
    
    NSMutableArray *sortedArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < array.count; i ++) {
        int max = i;
        for (int j = i + 1; j < array.count; j ++) {
            
            if ([[(ALAsset *)[array objectAtIndex:i] valueForProperty:ALAssetPropertyDate] compare:[(ALAsset *)[array objectAtIndex:j] valueForProperty:ALAssetPropertyDate] ] == NSOrderedAscending) {
                max = j;
            }
        }
        ALAsset *asset = [array objectAtIndex:i];
        [array setObject:[array objectAtIndex:max] atIndexedSubscript:i];
        [array setObject:asset atIndexedSubscript:max];
    }
    return sortedArray;
}

@end