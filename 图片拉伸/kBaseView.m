//
//  kBaseView.m
//  图片拉伸
//
//  Created by 张坤 on 15/12/24.
//  Copyright © 2015年 KZ. All rights reserved.
//

#import "kBaseView.h"
#define kLabelWidth 120
@interface kBaseView ()
{
    UILabel *_kLabel;
    NSString *_labelText;
    CGRect _buttonRect;
}
@end
@implementation kBaseView

- (instancetype)initWithFrame:(CGRect)frame labelText:(NSString *)labelText buttonRect:(CGRect)buttonRect
{
    _labelText  = labelText;
    _buttonRect = buttonRect;
    self = [super initWithFrame:frame];
    if (self) {
        [self setContentView];
    }
    return self;
}
- (void)setContentView{
    _kLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kLabelWidth, self.bounds.size.height)];
    [_kLabel setText:_labelText];
    [_kLabel setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:_kLabel];
    
    CGPoint point = self.center;
    point.x = (self.bounds.size.width - kLabelWidth) * 0.5 + kLabelWidth;
    point.y = self.bounds.size.height/2;
    
    _kButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_kButton setBounds:_buttonRect];
    [_kButton setCenter:point];
    [self addSubview:_kButton];
}

@end
