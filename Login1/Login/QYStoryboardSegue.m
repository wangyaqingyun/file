//
//  QYStoryboardSegue.m
//  Login
//
//  Created by qingyun on 15/9/7.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYStoryboardSegue.h"

@implementation QYStoryboardSegue

-(void)perform{
    
    UIViewController *sourceVC = self.sourceViewController;
    UIViewController *dstVC = self.destinationViewController;
    
    if (![self.identifier isEqualToString:@"login"]) {
        return;
    }
    
    
    //取出sourceVC中username 和password 进行验证
    
    NSString *usernameString = [sourceVC valueForKeyPath:@"username.text"];
    NSString *passwordString = [sourceVC valueForKeyPath:@"password.text"];
    
    //用户名密码不能为空
    if ([usernameString isEqualToString:@""] || [passwordString isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告" message:@"用户名和密码不能为空" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        return;
    }
    
    //验证用户名密码是否正确（正常情况下是拿用户名密码跟服务器进行比较，得到返回值之后再做其他操作）
    if (![usernameString isEqualToString:@"q"] || ![passwordString isEqualToString:@"1"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"用户名或密码有误" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        return;
    }
    
    //键盘收回
    
    [sourceVC.view endEditing:YES];
    
    dstVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [sourceVC presentViewController:dstVC animated:YES completion:^{
        [sourceVC setValue:@"" forKeyPath:@"username.text"];
    }];
    
}
@end
