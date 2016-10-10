//
//  ViewController.m
//  UIPickerView
//
//  Created by cjy on 16/10/10.
//  Copyright © 2016年 cjy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<
//数据协议代理,处理数据时的代理协议函数
UIPickerViewDataSource,
//普通协议代理,处理视图选取等普通时间协议功能
UIPickerViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //创建视图对象
    //显示多组数据和多个元素选择以供选择
    //例如选日期,时间,日历效果
    //地区地址等功能
    UIPickerView *pickerView = [[UIPickerView alloc]init];
    pickerView.frame = CGRectMake(10, 100, 300, 200);
    //设置普通代理对象为当前的视图图控制器
    pickerView.delegate = self;
    //设置数据代理对象为当前的试图控制器
    pickerView.dataSource = self;
    
    [self.view addSubview:pickerView];
}
//实现获取组数的协议函数
//返回值为选择视图的组数
//整数类型
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    //返回3组
    return 3;

}
//实现每组元素的个数
//每组有多少行
//P1:调用此协议的选择视图本身
//P2:第几组的元素个数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (component == 0 ) {
        return 5;
    }else if (component == 1){
        return 10;
    }else{
    //每组3行
    return 20;
    }
}
//显示每个元素内容
//P1:调用此协议的选择视图本身
//P2:行数
//P3:组数
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    NSString *str = [NSString stringWithFormat:@"%ld组%ld行",component+1,row+1];
    return str;
}
//设置每行高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    
    return 80;

}
//可以将自定义的视图显示到屏幕上
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.png",(row)%4+1]];
    UIImageView *iView = [[UIImageView alloc]initWithImage:image];
    iView.frame = CGRectMake(0, 0, 80, 80);
    return iView;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
