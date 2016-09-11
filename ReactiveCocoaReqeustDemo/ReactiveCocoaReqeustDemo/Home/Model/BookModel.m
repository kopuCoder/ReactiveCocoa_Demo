//
//  BookModel.m
//  ReactiveCocoaReqeustDemo
//
//  Created by kopuCoder on 16/9/11.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//

#import "BookModel.h"

@implementation BookModel

- (void)setPrice:(NSString *)price{
    _price = [NSString stringWithFormat:@"价格:%@",price];
}
@end
