//
//  ViewController.m
//  Login
//
//  Created by qingyun on 15/9/7.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"
#import "QYFirstViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [_username becomeFirstResponder];
}

-(void)viewDidDisappear:(BOOL)animated{
//    _username.text = @"";
//    _password.text = @"";
}

#if 0
- (IBAction)login:(UIButton *)sender {
    
    //用户名密码不能为空
    if ([_username.text isEqualToString:@""] || [_password.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告" message:@"用户名和密码不能为空" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        return;
    }
    
    //验证用户名密码是否正确（正常情况下是拿用户名密码跟服务器进行比较，得到返回值之后再做其他操作）
    if (![_username.text isEqualToString:@"q"] || ![_password.text isEqualToString:@"1"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"用户名或密码有误" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        return;
    }
    
    //键盘收回
    
    [self.view endEditing:YES];
    
    //登录
    QYFirstViewController *firstVC = [[QYFirstViewController alloc] init];
    [firstVC setValue:_username.text forKey:@"userN"];
    //视图控制器切换的效果
    firstVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:firstVC animated:YES completion:^{
        _username.text = @"";
        _password.text = @"";
    }];
    
    
}


//将self.view 改为UIControl类 然后对view添加点击事件
- (IBAction)hiddenKeyBoard:(UIControl *)sender {
    //键盘收回
    
    [self.view endEditing:YES];
}
#endif

//开始点击
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
  //键盘回收
    [self.view endEditing:YES];
}

//模态之前准备工作（可以书写自己的代码），但是不能阻止模态
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    UIViewController *sourceVC = segue.sourceViewController;
    UIViewController *destinationVC = segue.destinationViewController;
    
    [destinationVC setValue:_username.text forKey:@"userN"];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
