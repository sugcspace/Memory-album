//
//  MACollectionViewController.m
//  Memory album
//
//  Created by sugc on 16/2/26.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+MAUtils.h"
#import "MACollectionViewController.h"
#import "MAProfileView.h"


@interface MACollectionViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UITableView *albumTableView;
@property (nonatomic, strong) MAProfileView *profileView;

@end

@implementation MACollectionViewController


- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.albumTableView];
    [self.scrollView addSubview:self.profileView];
       self.tabBarItem.title = @"收藏";
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    
}

- (void)viewDidAppear:(BOOL)animated{
    self.scrollView.contentOffset = CGPointMake(0.8 *[UIScreen mainScreen].bounds.size.width, 0);
}

- (UITableView *)albumTableView{
    if (!_albumTableView) {
        _albumTableView = [[UITableView alloc] initWithFrame:CGRectMake(0.8 * [UIScreen mainScreen].bounds.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        //        _albumTableView.delegate = self.helper;
        //        _albumTableView.dataSource = self.helper;
        
        _albumTableView.backgroundColor = [UIColor blueColor];
    }
    return _albumTableView;
}


- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64 - 49)];
        _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width *1.8, 0);
        _scrollView.pagingEnabled = YES;
        _scrollView.contentOffset = CGPointMake(0.8 *[UIScreen mainScreen].bounds.size.width, 0);
        _scrollView.bounces = NO;
        _scrollView.delegate = self;
        _scrollView.backgroundColor = [UIColor grayColor];
    }
    return _scrollView;
}

- (MAProfileView *)profileView{
    if (!_profileView) {
        _profileView = [[MAProfileView alloc] initWithFrame:CGRectMake(0, 0, 0.8 * [UIScreen mainScreen].bounds.size.width, self.scrollView.height)];
    }
    return _profileView;
}
@end