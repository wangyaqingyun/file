//
//  QYSecondViewController.m
//  Login
//
//  Created by qingyun on 15/9/7.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYSecondViewController.h"

@interface QYSecondViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic, strong) NSString *textString;
@end

@implementation QYSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _textField.text = _textString;
    
    // Do any additional setup after loading the view.
}

- (IBAction)back:(UIButton *)sender {
    self.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self dismissViewControllerAnimated:YES completion:^{
        //发送通知（参数介绍：1、通知名称 2、发送者 3、通知内容）
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changValue" object:nil userInfo:@{@"value":_textField.text}];
    }];
}
//点击键盘return 触发DidEndOnExit事件,调用hiddenKeyBoard (收回键盘)
- (IBAction)hiddenKeyBoard:(UITextField *)sender {
    [self.view endEditing:YES];
    //[sender resignFirstResponder];
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
