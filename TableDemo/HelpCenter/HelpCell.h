//
//  HelpCell.h
//  SuperCreditCard
//
//  Created by apple on 16/11/4.
//  Copyright © 2016年 FlyingFinancial.hk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HelpCenterModel.h"

@interface HelpCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *messageLabel;//列表信息

-(void)showViewWithModelData:(HelpCenterModel*)dataModel;//初始化视图

@end
