//
//  MAContext.m
//  Memory album
//
//  Created by sugc on 16/2/23.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "MAContext.h"

#define MAalnumName "memory albums"
static ALAssetsGroup *sharedGroup = nil;

@interface MAContext ()

@end

@implementation MAContext

+ (instancetype)sharedContext{
    static MAContext *shareContext = nil;
    static dispatch_once_t onceTokeContext;
    dispatch_once(&onceTokeContext, ^{
        shareContext = [[MAContext alloc] init];
    });
    return shareContext;
}

- (UINavigationController *)rootViewController{
    UINavigationController *rootViewController = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    return rootViewController;
}

- (ALAssetsLibrary *)sharedAssetsLibrary{
    static ALAssetsLibrary *sharedLibrary = nil;
    static dispatch_once_t onceTokeLibrary;
    dispatch_once(&onceTokeLibrary, ^{
        sharedLibrary = [[ALAssetsLibrary alloc] init];
    });
    return sharedLibrary;
}

//创建之后若是被手动删除则无法查找到。并且不会走到fail路径。

- (ALAssetsGroup *)sharedAssetsGroup{
    
    return sharedGroup;
    
}


- (void)initConfiguration{
    
    ALAssetsLibrary *lib = [self sharedAssetsLibrary];
    __block BOOL isHaveAlbum = false;
    [lib enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop){
        if ([[group valueForProperty:ALAssetsGroupPropertyName] isEqualToString:@MAalnumName]) {
            sharedGroup = group;
            isHaveAlbum = YES;
        }
        if (group == nil) {
            if (!isHaveAlbum) {
                [lib addAssetsGroupAlbumWithName:@MAalnumName resultBlock:^(ALAssetsGroup *group){
                    sharedGroup = group;
                    
                } failureBlock:^(NSError *erro){
                    
                }];
                
            }

        }
    } failureBlock:^(NSError *erro){
        
        
    }];
    
}
@end