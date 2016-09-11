//
//  ReactiveCocoaManager.h
//  RacDemo_1
//
//  Created by kopuCoder on 16/8/28.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ReactiveCocoaManager : NSObject

- (instancetype)calculation:(NSInteger(^)(NSInteger argv))calculationBlock;

- (instancetype)descAction:(NSInteger(^)(NSInteger argv))descBlock;

- (NSInteger)result;
@end
