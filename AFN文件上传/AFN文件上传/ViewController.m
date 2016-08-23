//
//  ViewController.m
//  AFN文件上传
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
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //
    [manager POST:@"http://localhost/post/upload.php" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //
        NSString *path = [[NSBundle mainBundle]pathForResource:@"mm.jpg" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        /**
         *  要上传的文件(二进制)
         *  文件要保存的字段(程序员给)
         *  上传到服务器后的名字
         *  上传的类型
         */
        [formData appendPartWithFileData:data name:@"userfile" fileName:@"meinv.jpg" mimeType:@"image/jpg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        NSLog(@"已经下载的大小%lld",uploadProgress.completedUnitCount);
        
        NSLog(@"下载的进度%f",uploadProgress.fractionCompleted);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

@end
