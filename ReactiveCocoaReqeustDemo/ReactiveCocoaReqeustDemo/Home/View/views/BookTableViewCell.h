//
//  BookTableViewCell.h
//  ReactiveCocoaReqeustDemo
//
//  Created by kopuCoder on 16/9/11.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookModel.h"
@interface BookTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;
/**book模型*/
@property (nonatomic,strong)BookModel * book;
@end
