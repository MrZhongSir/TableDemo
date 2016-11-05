//
//  HelpView.h
//  SuperCreditCard
//
//  Created by apple on 16/11/4.
//  Copyright © 2016年 FlyingFinancial.hk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HelpCenterModel.h"

@interface HelpView : UIView

@property (nonatomic,strong) UIButton *backButton;//点击按钮
@property (nonatomic,strong) UILabel *helpTitleLabel;//标题
@property (nonatomic,strong) UIImageView *noticeImageView;//标图

- (instancetype)initWithFrame:(CGRect)frame WithModel:(HelpCenterModel*)model;

@end
