//
//  MAProfileSettingViewHelper.m
//  Memory album
//
//  Created by sugc on 16/2/27.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAProfileSettingViewHelper.h"

@interface MAProfileSettingViewHelper ()

@end

@implementation MAProfileSettingViewHelper

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


@end