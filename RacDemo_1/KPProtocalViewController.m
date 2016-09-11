//
//  KPProtocalViewController.m
//  RacDemo_1
//
//  Created by kopuCoder on 16/9/9.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//

#import "KPProtocalViewController.h"
#define RandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];

@interface KPProtocalViewController ()

@property (weak, nonatomic) IBOutlet UIButton *sendBtn;

@property (weak, nonatomic) IBOutlet UITextField *inputTextFiled;


@end

@implementation KPProtocalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RandomColor;
    self.title = @"二级页面";
    
    [self.inputTextFiled.rac_textSignal subscribeNext:^(id x) {
        
    }];
    
    //防止循环引用，配对使用
        @weakify(self);
    [[self.sendBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        [self.delegateSignal sendNext:self.inputTextFiled.text];
    }];
    
    
}

- (void)dealloc{
    NSLog(@"KPProtocalViewController ---->dealloc");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
