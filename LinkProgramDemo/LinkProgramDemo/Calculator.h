//
//  Calculator.h
//  LinkProgramDemo
//
//  Created by kopuCoder on 16/9/8.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Calculator : NSObject

/**total*/
@property (nonatomic,assign)CGFloat total;
- (Calculator *)calculator:(CGFloat (^)(CGFloat argv))calculation;
- (Calculator *)equeal:(BOOL(^)(CGFloat argv))operation;
@end
