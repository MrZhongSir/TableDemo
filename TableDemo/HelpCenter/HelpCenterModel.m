//
//  HelpCenterModel.m
//  SuperCreditCard
//
//  Created by apple on 16/10/31.
//  Copyright © 2016年 FlyingFinancial.hk. All rights reserved.
//

#define Main_Screen_Width  [[UIScreen mainScreen] bounds].size.width  //主屏幕的宽度

#import "HelpCenterModel.h"

@implementation HelpCenterModel

- (instancetype)initWithDictionary:(NSDictionary*)dictionary
{
    self = [super init];
    if (self) {
        [self initWithData:dictionary];
    }
    return self;
}

-(void)initWithData:(NSDictionary*)data
{
    //赋值
    self.title = [data objectForKey:@"title"];
    self.message = [data objectForKey:@"message"];
    self.isShowMessage = NO;
    
    self.titleHeight = [self.title boundingRectWithSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width-70, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16.0]} context:nil].size.height;
    
    self.messageHeight = [self.message boundingRectWithSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width-35, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16.0]} context:nil].size.height;
    
    
    self.cellNormalHeight = 15+self.titleHeight+15+1;
    self.cellPressHeight = 15+self.titleHeight+15+self.messageHeight+15+1;
}

@end
