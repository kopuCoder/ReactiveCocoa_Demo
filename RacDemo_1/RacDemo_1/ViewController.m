//
//  ViewController.m
//  RacDemo_1
//
//  Created by kopuCoder on 16/8/28.
//  Copyright © 2016年 kopuCoder. All rights reserved.
//

#import "ViewController.h"
#import "GlobleHeader.h"
#import "KPProtocalViewController.h"
@interface ViewController ()

/**代理信号*/
@property (nonatomic,strong)RACSubject * delegateSignal;

@property (weak, nonatomic) IBOutlet UILabel *protocalLable;

/**测试代理Btn*/
@property (weak, nonatomic) IBOutlet UIButton *testProtocalBtn;

/**测试textFiled*/
@property (nonatomic,weak)IBOutlet UITextField *  textFiled;

/**上传信号*/
@property (nonatomic,strong)RACSignal * uploadSiganl1;
@property (nonatomic,strong)RACSignal * uploadSiganl2;


@property (weak, nonatomic) IBOutlet UILabel *bottomContentLable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"一级页面";
  #pragma mark ---基础信号学习---
    /*
    [self shareRacSignal];
    [self shareRACSubject];
    [self shareRACReplaySubject];
    */
    
    [self replaceOCDevelop];
}

#pragma mark ---share---
- (void)shareRacSignal{
    //1.创建信号  底层实现该信号拥有一个_didSubscribe Block
    RACSignal * singal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        //订阅者发出信号
        [subscriber sendNext:@"茂茂发出的信号"];
        [subscriber sendCompleted]; //信号发送完成，底层实现是对信号所占资源进行回收
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"销毁信号");
        }];
    }];
    
    //2.订阅信号 底层实现：创建一个订阅者，订阅者持有改nextBlcok，同时调用订阅者所属信号的 _didSubscribe Block
    [singal subscribeNext:^(id x) {
        //接收信号
        NSLog(@"收到信号：%@",x);
    }];
}

- (void)shareRACSubject{
    
    //@interface RACSubject : RACSignal <RACSubscriber>这货继承自RACSignal
    RACSubject * subjectSignal = [RACSubject subject]; //创建信号，里面维护着一个订阅者数组
    [subjectSignal subscribeNext:^(id x) { //创建一个订阅者数组，添加进入信号所管理的这个订阅者数组中，每个订阅者自己又保存着这个nextBlock函数
        NSLog(@"订阅者1收到信号：%@",x);
    }];
    
    [subjectSignal subscribeNext:^(id x) {
        NSLog(@"订阅者2收到信号：%@",x);
    }];
    
    //遍历所有的订阅者，发出消息，让每个一个订阅者都执行nextBlcok函数
    [subjectSignal sendNext:@"这里是基站，我发出信号啦，赶紧接收"];
    
    /**然并卵，这里是收不到信号的*/
    [subjectSignal subscribeNext:^(id x) { //创建一个订阅者数组，添加进入信号所管理的这个订阅者数组中，每个订阅者自己又保存着这个nextBlock函数，
        NSLog(@"3收到信号：%@",x);
    }];
    
    /**研究RACSubject 可知，订阅者必须是在发出信号之前才能收到收到信号*/
}

- (void)shareRACReplaySubject{
    
    //@interface RACReplaySubject : RACSubject 这货是继承自RACSubject
    RACReplaySubject * replaySignal = [RACReplaySubject subject];
    [replaySignal subscribeNext:^(id x) { //遍历valuesReceived数组，调用当前订阅者的didNextBlock方法
        NSLog(@"订阅者1收到信号:%@",x);
    }];
    
    [replaySignal subscribeNext:^(id x) { 
        NSLog(@"订阅者2收到信号:%@",x);
    }];
    
    [replaySignal sendNext:@"我就发送一条数据"];//遍历订阅者数组，如果存在，则调用订阅者的didNexkBlock方法
    [replaySignal subscribeNext:^(id x) { //遍历valuesReceived数组，调用当前订阅者的didNextBlock方法
        NSLog(@"订阅者3收到信号:%@",x);
    }];
    /**RACReplaySubject既可以先订阅信号再发送信号，也可以实现先发送信号，后订阅信号*/
}

#pragma mark ---end---

#pragma mark ---RAC替代OC开发---
- (void)replaceOCDevelop{
    //1.代替监听事件
    @weakify(self);
    [[self.testProtocalBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        //2.代替代理
        KPProtocalViewController * protocalVC = [[KPProtocalViewController alloc] init];
        protocalVC.delegateSignal = self.delegateSignal;
        [self.navigationController pushViewController:protocalVC animated:YES];
    }];
    
    
    //3.代替KVO
    [[self.view rac_valuesForKeyPath:@"frame" observer:self] subscribeNext:^(id x) {
        NSLog(@"控制器View frame:%@",x);
    }];
    
    /** 等价KVO
     [RACObserve(self.view, frame) subscribeNext:^(id x) {
     
     }];*/
    
    
    //4.代替通知监听
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardWillShowNotification object:nil] subscribeNext:^(id x) {
        
        NSLog(@"键盘弹出");
    }];
    
    
    //5.rac_textSignal 代替textFiled各种代理方法 --->文本框发生改变就会发出这个信号。
    [self.textFiled.rac_textSignal subscribeNext:^(id x) {
        NSLog(@"输入信息:%@",x);
    }];
    RAC(self.bottomContentLable,text) = self.textFiled.rac_textSignal;
    
    //6.处理当界面有多次请求时，需要都获取到数据时，才能展示界面
    [self simulationRequest];
}

- (void)simulationRequest{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        self.uploadSiganl1 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
            sleep(arc4random_uniform(5));//模拟网络请求
            [subscriber sendNext:@"imageID:\"123\",url:\"www.baidu.com/picture/1\""];
            [subscriber sendCompleted];
            return nil;
        }];
        
        self.uploadSiganl2 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            sleep(arc4random_uniform(5));//模拟网络请求
            [subscriber sendNext:@"imageID:\"256\",url:\"www.baidu.com/picture/2\""];
            return nil;
        }];
        
        [self rac_liftSelector:@selector(UpdateUIWithResponse:secondResponse:) withSignalsFromArray:@[self.uploadSiganl1,self.uploadSiganl2]];
    });
    
}

- (void)UpdateUIWithResponse:(id )responseObject secondResponse:(id )secondResponseObject{
    NSLog(@"\n 第一张图片返回信息:%@ \n 第二章图片返回信息:%@",responseObject,secondResponseObject);
    
}
#pragma mark ---end---


#pragma mark ---setter/getter---
- (RACSubject *)delegateSignal{
    if (!_delegateSignal) {
        _delegateSignal = [RACSubject subject];
        @weakify(self);
        //实现方式一
        [_delegateSignal subscribeNext:^(id x) {
            @strongify(self);
            NSLog(@"收到代理信号:%@",x);
            self.protocalLable.text = x;
        }];
        
        //实现方式二
        //RAC(self.protocalLable,text) = _delegateSignal;
    }
    return _delegateSignal;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
@end
