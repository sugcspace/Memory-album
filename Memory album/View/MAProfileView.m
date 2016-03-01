//
//  MAProfileView.m
//  Memory album
//
//  Created by sugc on 16/2/25.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAProfileView.h"
#import "MAUserBasicInfoView.h"

@interface MAProfileView ()

@property (nonatomic, strong) MAUserBasicInfoView *basicInfoView;
@end

@implementation MAProfileView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.basicInfoView];
    }
    return self;
}

- (MAUserBasicInfoView *)basicInfoView{
    if (!_basicInfoView) {
        _basicInfoView = [[MAUserBasicInfoView alloc] init];
        _basicInfoView.backgroundColor = [UIColor whiteColor];
    }
    return _basicInfoView;
}





@end