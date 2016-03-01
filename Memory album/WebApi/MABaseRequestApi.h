//
//  BaseRequstApi.h
//  Memory album
//
//  Created by sugc on 16/2/24.
//  Copyright © 2016年 sugc. All rights reserved.
//
/*
 负责底层发送请求，上传下载任务
 
 */

#import <Foundation/Foundation.h>
@interface MARequestParam : NSObject

@property (nonatomic, strong) NSDictionary *paramDic;
@property (nonatomic, strong) id target;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, assign) SEL okSelector;
@property (nonatomic, assign) SEL failSelector;
@property (nonatomic, assign) SEL erroSelector;

@end
@interface MABaseRequestApi : NSObject

- (instancetype)sharedApi;
- (void)postRequestWithParam:(MARequestParam *)param;
- (void)getRequestWithParam:(MARequestParam *)param;
- (void)postImageRequest;

@end

