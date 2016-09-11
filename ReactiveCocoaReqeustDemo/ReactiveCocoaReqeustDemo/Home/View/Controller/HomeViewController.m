//
//  ViewController.m
//  ReactiveCocoaReqeustDemo
//
//  Created by kopuCoder on 16/9/11.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//

#import "HomeViewController.h"
#import "GlobleHeader.h"
#import "HomeViewModel.h"
#import "MBProgressHUD+XMG.h"
#import "HomeMainView.h"
#import "BookTableViewCell.h"
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

/**ViewModel*/
@property (nonatomic,strong)HomeViewModel * homeVM;
/**mainView*/
@property (nonatomic,strong)HomeMainView * homeMainView;
@end

@implementation HomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadHomeData];
}

#pragma mark ---tableview Delegate---

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.homeVM getListData] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BookTableViewCell * cell = [BookTableViewCell cellWithTableView:tableView];
    NSArray * dataArray = [self.homeVM getListData];
    if(indexPath.row<dataArray.count){
        cell.book = dataArray[indexPath.row];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}


- (void)loadHomeData{
    
    @weakify(self);
    //请求数据
    [[self.homeVM.requestCommand execute:nil] subscribeNext:^(id x) {
        @strongify(self);
        //数据请求完成，刷新UI
        [self.homeMainView.tableView reloadData];
    }];
    
    //请求过程中
    [[self.homeVM.requestCommand.executing skip:1] subscribeNext:^(id x) {
        if([x boolValue]){
            [MBProgressHUD showMessage:@"加载中。。。" toView:self.view];
            
        }else{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }
    }];
    
}

#pragma mark ---getter/setter---
- (HomeViewModel *)homeVM{
    if (!_homeVM) {
        _homeVM = [[HomeViewModel alloc] init];
    }
    return _homeVM;
}
#pragma mark ---生命周期---
- (void)loadView{
    if([self isViewLoaded]) return;
    [super loadView];
    self.homeMainView = [HomeMainView mainView];
    self.homeMainView.tableView.delegate = self;
    self.homeMainView.tableView.dataSource = self;
    self.view = self.homeMainView;
}

@end
