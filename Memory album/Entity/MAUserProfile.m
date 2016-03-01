//
//  UserProfile.m
//  Memory album
//
//  Created by sugc on 16/2/26.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAUserProfile.h"

@interface MAUserProfile ()

@end

@implementation MAUserProfile

- (instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.userName = @"";
        self.userId = @"";
        self.signature = @"";
        self.level = 0;
    }
    return self;
}
- (NSDictionary *)dictionaryWithProfile{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:self.userName forKey:@"userName"];
    [dic setObject:self.userId forKey:@"userId"];
    [dic setObject:self.signature forKey:@"signature"];
    [dic setObject:@(self.level) forKey:@"level"];
    
    return dic;
}



@end