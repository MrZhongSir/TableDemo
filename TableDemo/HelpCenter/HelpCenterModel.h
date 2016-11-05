//
//  HelpCenterModel.h
//  SuperCreditCard
//
//  Created by apple on 16/10/31.
//  Copyright © 2016年 FlyingFinancial.hk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface HelpCenterModel : NSObject

@property (nonatomic,strong) NSString* title;//标题
@property (nonatomic,strong) NSString* message;//答案信息
@property (nonatomic,assign) BOOL isShowMessage;//标记是否展示信息

@property (nonatomic,assign) CGFloat titleHeight;//标题信息占用的视图高度
@property (nonatomic,assign) CGFloat messageHeight;//答案''占用的视图高度
@property (nonatomic,assign) CGFloat cellNormalHeight;//cell占用的视图高度(正常情况下)
@property (nonatomic,assign) CGFloat cellPressHeight;//cell占用的视图高度(选中情况下)

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;//初始化函数

@end
