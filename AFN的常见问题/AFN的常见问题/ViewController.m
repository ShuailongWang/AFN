//
//  ViewController.m
//  AFN的常见问题
//
//  Created by czbk on 16/7/18.
//  Copyright © 2016年 王帅龙. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *myWeb;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self loadData];
    
    [self loadMyData];
}

-(void)loadMyData{
    //manager
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //MARK:问题3 修改AFN支持接收的文本类型 : text/plain
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain", nil];
    
    //MARK:问题2:接收到的数据是二进制
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //问题4: 修改AFN支持向服务器发送JSON形式的二进制数据
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    //传输的数据
    NSDictionary *dict = @{@"name":@"lisi"};
    
    //post
    [manager POST:@"http://127.0.0.1/post/postjson.php" parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *str = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@",str);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        
    }];
}

-(void)loadData{
    
    //
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //MARK:问题1 修改AFN支持接收的文本类型 : text/html
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    
    //MARK:问题2 不再把服务器返回的数据当成json解析 只当成最原始的二进制返回
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //
    [manager GET:@"http://www.qiushibaike.com" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //NSLog(@"%@",responseObject);
        
        //把返回的类型转换成字符串
        NSString *html = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        //赋值给webView
        [self.myWeb loadHTMLString:html baseURL:[NSURL URLWithString:@"http://www.qiushibaike.com"]];
    
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
@end
