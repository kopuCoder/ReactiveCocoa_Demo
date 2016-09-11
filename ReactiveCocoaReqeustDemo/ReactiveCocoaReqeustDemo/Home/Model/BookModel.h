//
//  BookModel.h
//  ReactiveCocoaReqeustDemo
//
//  Created by kopuCoder on 16/9/11.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookModel : NSObject

/**title*/
@property (nonatomic,copy)NSString * title;
/**书名*/
@property (nonatomic,copy)NSString * summary;
/**出版日期*/
@property (nonatomic,copy)NSString * pubdate;
/**price*/
@property (nonatomic,copy)NSString * price;

/**图片*/
@property (nonatomic,copy)NSString * image;


@end
