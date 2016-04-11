//
//  kBaseView.h
//  图片拉伸
//
//  Created by 张坤 on 15/12/24.
//  Copyright © 2015年 KZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface kBaseView : UIView

- (instancetype)initWithFrame:(CGRect)frame labelText:(NSString *)labelText buttonRect:(CGRect)buttonRect;

@property (nonatomic, strong) UIButton *kButton;

@end
