//
//  KPProtocalViewController.h
//  RacDemo_1
//
//  Created by kopuCoder on 16/9/9.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobleHeader.h"

@interface KPProtocalViewController : UIViewController

/**代理信号*/
@property (nonatomic,strong)RACSubject * delegateSignal;
@end
