//
//  BookTableViewCell.m
//  ReactiveCocoaReqeustDemo
//
//  Created by kopuCoder on 16/9/11.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//

#import "BookTableViewCell.h"
#import "UIImageView+AFNetworking.h"
@interface BookTableViewCell()


@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel * bookNameLable;

@property (weak, nonatomic) IBOutlet UILabel * descLable;

@property (weak, nonatomic) IBOutlet UILabel * priceLable;

@end

@implementation BookTableViewCell

NSString * const BookTableViewCellCellID = @"BookTableViewCell";
+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    BookTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:BookTableViewCellCellID];
    if(nil == cell){
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BookTableViewCell" owner:nil options:nil] lastObject];
    }
    return cell;
}


- (void)setBook:(BookModel *)book{
    _book = book;
    [self.iconImageView setImageWithURL:[NSURL URLWithString:book.image]];
    self.bookNameLable.text = book.title;
    self.descLable.text = book.summary.length>0?book.summary:@"暂无简介。。。。。";
    self.priceLable.text = book.price;
    
}

@end
