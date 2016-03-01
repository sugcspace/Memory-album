//
//  MAAlbumViewController.m
//  Memory album
//
//  Created by sugc on 16/2/26.
//  Copyright © 2016年 sugc. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "UIView+MAUtils.h"
#import "MAAlbumViewController.h"
#import "MAProfileView.h"
#import "MAAlbumViewControllerHelper.h"

@interface MAAlbumViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UITableView *albumTableView;
@property (nonatomic, strong) MAProfileView *profileView;
@property (nonatomic, strong) id<UITableViewDataSource,UITableViewDelegate> helper;

@end

@implementation MAAlbumViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.albumTableView];
    [self.scrollView addSubview:self.profileView];
    self.tabBarItem.title = @"相册";
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    
}

- (void)viewDidAppear:(BOOL)animated{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.scrollView.contentOffset = CGPointMake(0.8 *[UIScreen mainScreen].bounds.size.width, 0);
}
- (UITableView *)albumTableView{
    if (!_albumTableView) {
        _albumTableView = [[UITableView alloc] initWithFrame:CGRectMake(0.8 * [UIScreen mainScreen].bounds.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
//        _albumTableView.delegate =  self.helper;
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
        _scrollView.backgroundColor = [UIColor redColor];
    }
    return _scrollView;
}



- (MAProfileView *)profileView{
    if (!_profileView) {
        _profileView = [[MAProfileView alloc] initWithFrame:CGRectMake(0, -0, 0.8 * [UIScreen mainScreen].bounds.size.width, self.scrollView.height)];
    }
    return _profileView;
}

- (id<UITableViewDelegate,UITableViewDataSource>)helper{
    if (!_helper) {
        _helper = (id<UITableViewDataSource,UITableViewDelegate>)[[MAAlbumViewControllerHelper alloc] init];
    }
    return _helper;
}


@end