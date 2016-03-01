//
//  MATabBarController.m
//  Memory album
//
//  Created by sugc on 16/2/25.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MATabBarController.h"

@interface MATabBarController ()<UIScrollViewDelegate>

@end


@implementation MATabBarController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self configureScrollView];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}


- (void)configureScrollView{
    _scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width *1.5 , [UIScreen mainScreen].bounds.size.height);
    _scrollView.delegate = self;
    _scrollView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview: _scrollView];
}

@end