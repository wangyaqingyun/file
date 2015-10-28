//
//  QYFirstViewController.m
//  Login
//
//  Created by qingyun on 15/9/7.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYFirstViewController.h"
#import "QYChangeLableValue.h"
@interface QYFirstViewController ()<QYChangeLableValue>
@property(nonatomic,strong)NSString *userN;//用户名
@property (weak, nonatomic) IBOutlet UILabel *welcome;
@property (weak, nonatomic) IBOutlet UILabel *label;//写个啥label

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
    //模态渐变效果设置
    self.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    //消失
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //获取目标视图控制器 即 QYSecondViewController的类对象
    UIViewController *destinationVC = segue.destinationViewController;
    //通过KVC方式设置destinationVC 的textString
    [destinationVC setValue:_label.text forKeyPath:@"textString"];
    //设置destinationVC的代理为self
    [destinationVC setValue:self forKeyPath:@"delegate"];
    
}

//更改_label的文本
-(void)changeLabelValue:(NSString *)value{
    _label.text = value;
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
