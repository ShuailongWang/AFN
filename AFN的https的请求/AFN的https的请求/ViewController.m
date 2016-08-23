//
//  ViewController.m
//  AFN的https的请求
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
    [self httpsDemo];
    
    //网路状态
    [self networkDemo];
}

-(void)networkDemo{
    //
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    /**
     *  AFNetworkReachabilityStatusUnknown          = -1, 网络状态未知
        AFNetworkReachabilityStatusNotReachable     = 0, 没有网络
        AFNetworkReachabilityStatusReachableViaWWAN = 1, 2g,3g,4g,5g
        AFNetworkReachabilityStatusReachableViaWiFi = 2, wifi
     *
     *  @param status 网络状态的类型
     */
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"%ld",(long)status);
    }];
    
    //打开监听的方法
    [manager startMonitoring];
}


-(void)httpsDemo{
    //
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 使AFN支持HTTPS请求 : 2.5.4之前
    // manager.securityPolicy.allowInvalidCertificates = YES;
    
    //让AFN支持HTTPS请求 : 2.6.1以后
    manager.securityPolicy.validatesDomainName = NO;
    
    //类型
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    
    //不解析json
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //
    [manager GET:@"https://mail.itcast.cn" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
        NSString *html = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@",html);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

@end
