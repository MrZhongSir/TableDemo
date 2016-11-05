//
//  HelpView.m
//  SuperCreditCard
//
//  Created by apple on 16/11/4.
//  Copyright © 2016年 FlyingFinancial.hk. All rights reserved.
//

#import "HelpView.h"
#define Main_Screen_Width  [[UIScreen mainScreen] bounds].size.width  //主屏幕的宽度
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

@implementation HelpView

- (instancetype)initWithFrame:(CGRect)frame WithModel:(HelpCenterModel*)model
{
    self = [super initWithFrame:frame];
    if (self) {
        self.helpTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, Main_Screen_Width-70, model.titleHeight)];
        self.helpTitleLabel.numberOfLines = 0;
        self.helpTitleLabel.font = [UIFont systemFontOfSize:16.0];
        self.helpTitleLabel.textColor = RGBACOLOR(0xd0, 0xa3, 0x58, 1);
        self.helpTitleLabel.text = model.title;
        self.noticeImageView = [[UIImageView alloc]initWithFrame:CGRectMake(Main_Screen_Width-28, 17, 13, 13)];
        self.noticeImageView.image = [UIImage imageNamed:@"helpcenter_down_arrow.png"];
        self.backButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.backButton.frame = self.bounds;
        
        [self addSubview:self.helpTitleLabel];
        [self addSubview:self.noticeImageView];
        [self addSubview:self.backButton];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
