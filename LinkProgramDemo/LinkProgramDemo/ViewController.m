//
//  ViewController.m
//  LinkProgramDemo
//
//  Created by kopuCoder on 16/9/8.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Calculation.h"
#import "Calculator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self linkProgram];//链式编程
    [self funcProgramm]; //函数式编程
}


- (void)funcProgramm{
    Calculator * calculator = [[Calculator alloc] init];
    //  10/2 = 5
    [[calculator calculator:^CGFloat(CGFloat argv) {
        argv+=10;
        argv/=2;
        return argv;
    }] equeal:^BOOL(CGFloat argv) {
        return argv ==10;
    }];
}

/**链式编程*/
- (void)linkProgram{
    CGFloat result =  [NSObject makeCalculators:^(CalculationMaker *maker) {
        maker.add(10).add(5).sub(12);
    }];
    NSLog(@"result:%lf",result);//result:3.000000
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
