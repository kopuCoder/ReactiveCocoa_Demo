//
//  HomeMainView.m
//  ReactiveCocoaReqeustDemo
//
//  Created by kopuCoder on 16/9/11.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//

#import "HomeMainView.h"
#define kWidth   [UIScreen mainScreen].bounds.size.width
#define kHeight  [UIScreen mainScreen].bounds.size.height
#define RandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
@implementation HomeMainView

+ (instancetype)mainView{
    HomeMainView * mainView = [[HomeMainView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    return mainView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RandomColor;
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews{
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    self.tableView = tableView;
    [self addSubview:tableView];
}
@end
