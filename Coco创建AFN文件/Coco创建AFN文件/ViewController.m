//
//  ViewController.m
//  Coco创建AFN文件
//
//  Created by czbk on 16/7/18.
//  Copyright © 2016年 王帅龙. All rights reserved.
//

#import "ViewController.h"

#import <AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"...");
    
    //创建manager
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    /**
     *  <#Description#>
     *
     *  @param downloadProgress 下载的进度
     *
     *  @success 成功
     *
     *  @failure 失败
     */
    [manager GET:@"http://127.0.0.1/demo.json" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        //
        NSLog(@"%@",downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //
        NSLog(@"%@",task);
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
        NSLog(@"error %@",error);
    }];
}

@end
