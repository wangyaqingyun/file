//
//  QYFirstViewController.m
//  Login
//
//  Created by qingyun on 15/9/7.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYFirstViewController.h"

@interface QYFirstViewController ()
@property(nonatomic,strong)NSString *userN;//用户名
@property (weak, nonatomic) IBOutlet UILabel *welcome;

@end

@implementation QYFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _welcome.text = [NSString stringWithFormat:@"%@%@",_welcome.text,_userN];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)logout:(UIButton *)sender {
    
    self.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
