//
//  HomeViewModel.h
//  ReactiveCocoaReqeustDemo
//
//  Created by kopuCoder on 16/9/11.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GlobleHeader.h"
#import "BookModel.h"

@interface HomeViewModel : NSObject
/**请求命令*/
@property (nonatomic,strong,readonly)RACCommand * requestCommand;

- (NSArray <BookModel *>*)getListData;
@end
