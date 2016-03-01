//
//  main.m
//  Memory album
//
//  Created by sugc on 16/2/22.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "MAContext.h"
#import "MABaseRequestApi.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        MARequestParam *param = [[MARequestParam alloc] init];
        MABaseRequestApi *api = [[MABaseRequestApi alloc] init];
        [api postImageRequest];
        
        [[MAContext sharedContext] initConfiguration];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
