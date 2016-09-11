//
//  HomeMainView.h
//  ReactiveCocoaReqeustDemo
//
//  Created by kopuCoder on 16/9/11.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//

#import <UIKit/UIKit.h>

/**homeController View*/        
@interface HomeMainView : UIView
+ (instancetype)mainView;

@property (nonatomic,weak)UITableView *  tableView;
@end
