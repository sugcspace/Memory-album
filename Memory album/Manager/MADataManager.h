//
//  DataManager.h
//  Memory album
//
//  Created by sugc on 16/3/1.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MADataManager : NSObject

+ (instancetype)sharedDataManager;
- (NSArray *)localImage;
@end
