//
//  kImageStretchViewController.m
//  图片拉伸
//
//  Created by 张坤 on 15/12/24.
//  Copyright © 2015年 KZ. All rights reserved.
//

#import "kImageStretchViewController.h"
#import "kBaseView.h"
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define baseViewHeight 70
#define space 5
@interface kImageStretchViewController ()
{
    kBaseView *_kBaseView;
}
@end

@implementation kImageStretchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setContentView];
}
- (void)setContentView{
    UIImage *image = [UIImage imageNamed:@"background"];
    CGRect baseViewRect = CGRectMake(0, 20, screenWidth, baseViewHeight);
    CGRect normalButtonRect = CGRectMake(0, 0, image.size.width, image.size.height);
    CGRect buttonRect = CGRectMake(0, 0, 150, 50);
    
    //展示原始图片
    kBaseView *normalBaseView = [[kBaseView alloc]initWithFrame:baseViewRect labelText:@"原始尺寸" buttonRect:normalButtonRect];
    [normalBaseView.kButton setBackgroundImage:image forState:UIControlStateNormal];
    [self.view addSubview:normalBaseView];
    
    /******     iOS5.0 之前的拉伸效果     *****/
    baseViewRect.origin.y += (baseViewHeight + space);
    UIImage *beforeiOS5Img = [UIImage imageNamed:@"background"];
    kBaseView *beforeiOS5 = [[kBaseView alloc]initWithFrame:baseViewRect labelText:@"iOS5.0 之前" buttonRect:buttonRect];
    //-核心代码-//
    NSInteger leftCapWidth = beforeiOS5Img.size.width * 0.5f;
    NSInteger topCapHeight = beforeiOS5Img.size.height * 0.5f;
    //伸缩后重新赋值
    beforeiOS5Img = [beforeiOS5Img stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
    [beforeiOS5.kButton setBackgroundImage:beforeiOS5Img forState:UIControlStateNormal];
    //--------//
    [self.view addSubview:beforeiOS5];
    
    /*****     iOS5.0     *****/
    baseViewRect.origin.y += (baseViewHeight + space);
    UIImage *iOS5Image = [UIImage imageNamed:@"background"];
    kBaseView *iOS5BaseView = [[kBaseView alloc]initWithFrame:baseViewRect labelText:@"iOS5.0" buttonRect:buttonRect];
    //-核心代码-//
    CGFloat top5 = iOS5Image.size.height * 0.5;
    CGFloat bottom5 = iOS5Image.size.height * 0.5;
    CGFloat right5 = iOS5Image.size.width * 0.5;
    CGFloat left5 = iOS5Image.size.width * 0.5;
    UIEdgeInsets iOS5Insets = UIEdgeInsetsMake(top5, left5, bottom5, right5);
    //伸缩后重新赋值
    iOS5Image = [iOS5Image resizableImageWithCapInsets:iOS5Insets];
    [iOS5BaseView.kButton setBackgroundImage:iOS5Image forState:UIControlStateNormal];
    //--------//
    [self.view addSubview:iOS5BaseView];
    
    /*****     iOS6.0     *****/
    baseViewRect.origin.y += (baseViewHeight + space);
    UIImage *iOS6Image = [UIImage imageNamed:@"background"];
    kBaseView *iOS6BaseView = [[kBaseView alloc]initWithFrame:baseViewRect labelText:@"iOS6.0" buttonRect:buttonRect];
    //-核心代码-//
    CGFloat top6 = iOS6Image.size.height * 0.5;
    CGFloat bottom6 = iOS6Image.size.height * 0.5;
    CGFloat right6 = iOS6Image.size.width * 0.5;
    CGFloat left6 = iOS6Image.size.width * 0.5;
    UIEdgeInsets iOS6Insets = UIEdgeInsetsMake(top6, left6, bottom6, right6);
    //伸缩后重新赋值
    iOS6Image = [iOS6Image resizableImageWithCapInsets:iOS6Insets resizingMode:UIImageResizingModeStretch];
    [iOS6BaseView.kButton setBackgroundImage:iOS6Image forState:UIControlStateNormal];
    //--------//
    [self.view addSubview:iOS6BaseView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
