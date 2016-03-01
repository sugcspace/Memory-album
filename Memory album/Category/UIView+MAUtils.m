//
//  UIView+MAUtils.m
//  Memory album
//
//  Created by sugc on 16/2/26.
//  Copyright © 2016年 sugc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+MAUtils.h"

@implementation UIView (MAUtils)

- (CGFloat)width{
    return  self.frame.size.width;
}

- (void)setWidth:(CGFloat)width{

    self.frame = CGRectMake(self.left, self.top, width, self.height);
}

- (CGFloat)height{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height{
    self.frame = CGRectMake(self.left, self.top, self.width, height);
}

- (CGFloat)top{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)top{
    self.frame = CGRectMake(self.left, top, self.width, self.height);
}



- (CGFloat)bottom{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom{
    self.frame = CGRectMake(self.left, bottom - self.height, self.width, self.height);
}


- (CGFloat)left{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)left{
    self.frame = CGRectMake(left, self.top, self.width, self.height);
}

- (CGFloat)right{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right{
    self.frame = CGRectMake(right - self.width, self.top, self.width, self.height);
}



@end