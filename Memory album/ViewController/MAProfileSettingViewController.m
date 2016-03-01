//
//  MAProfileSettingView.m
//  Memory album
//
//  Created by sugc on 16/2/26.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+MAUtils.h"
#import "MAProfileSettingViewController.h"
#import "MAProfileSettingViewHelper.h"
@interface MAProfileSettingViewController ()< UIScrollViewDelegate>


@property (nonatomic, assign) CGFloat ratio;
@property (nonatomic, strong) MAProfileSettingViewHelper *helper;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *backGroudView;
@property (nonatomic, strong) UIButton *praiseButton;
@property (nonatomic, strong) UIButton *setBackGroudButton;


@end

@implementation MAProfileSettingViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    if ([[UIDevice currentDevice] systemVersion].floatValue >= 7.0) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    _ratio = [UIScreen mainScreen].bounds.size.width / 375.0;
    [self.view addSubview:self.tableView];
}

-(void)loadView{
    [super loadView];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
}
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    
}



- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.bounces = NO;
        _tableView.tableHeaderView = self.backGroudView;
        
        _tableView.delegate = self;
        _tableView.dataSource = self.helper;
    }
    return _tableView;
}

- (MAProfileSettingViewHelper *)helper{
    if (!_helper) {
        _helper = [[MAProfileSettingViewHelper alloc] init];
    }
    return  _helper;
}
- (UIImageView *)backGroudView{
    if (!_backGroudView) {
        _backGroudView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 235 * _ratio)];
        _backGroudView.image = [UIImage imageNamed:@"backGroud.jpg"];
        
       UIImageView *avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(15, self.backGroudView.bottom - 30, 60, 60)];
        avatarView.image = [UIImage imageNamed:@"avatar.png"];
        
        avatarView.layer.cornerRadius = 30;
        avatarView.layer.masksToBounds = YES;
        [_backGroudView addSubview:avatarView];
    }
    return _backGroudView;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y <= 70) {
        scrollView.bounces = NO;
    }
    else{
        scrollView.bounces = YES;
    }
    
    NSLog(@"%f",scrollView.contentOffset.y);
}



@end