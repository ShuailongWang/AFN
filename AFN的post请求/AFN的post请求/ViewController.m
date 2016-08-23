//
//  ViewController.m
//  AFN的post请求
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

    //
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //
    NSDictionary *dict = @{@"username":@"zhangsan",@"password":@"zhang"};
    
    [manager POST:@"http://127.0.0.1/login.php" parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

@end
