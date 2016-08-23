//
//  ViewController.m
//  AFN文件下载
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
    //
    [self downloadFile];
}

-(void)downloadFile{
    //
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //
    NSURL *url = [NSURL URLWithString:@"http://localhost/hao456.zip"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%@",downloadProgress);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        //下载的文件保存的临时路径
        NSLog(@"%@",targetPath);
        
        //本地文件路径
        NSString *path = @"/users/czbk/desktop/1.zip";
        return [NSURL fileURLWithPath:path];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        //
        NSLog(@"%@",filePath);
    }];
    
    [task resume];
}












@end








