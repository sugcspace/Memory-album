//
//  UserProfile.h
//  Memory album
//
//  Created by sugc on 16/2/26.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAUserProfile : NSObject

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *signature;
@property (nonatomic, assign) int level;

- (instancetype)initWithDictionary:(NSDictionary *)dic;
- (NSDictionary *)dictionaryWithProfile;

@end