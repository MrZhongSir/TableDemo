//
//  HelpCenterViewController.m
//  SuperCreditCard
//
//  Created by apple on 16/10/31.
//  Copyright © 2016年 FlyingFinancial.hk. All rights reserved.
//

#import "HelpCenterViewController.h"
#import "HelpCenterModel.h"
#import "HelpView.h"
#import "HelpCell.h"

#define Main_Screen_Width  [[UIScreen mainScreen] bounds].size.width  //主屏幕的宽度

@interface HelpCenterViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_helpData;//数据
}
@property (strong, nonatomic) IBOutlet UITableView *myTableView;//列表
@end

@implementation HelpCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _helpData = [[NSMutableArray alloc]init];//初始化
    
    //获取列表数据
    NSArray *array = [NSMutableArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"HelpCenterMessage" ofType:@"plist"]];
    
    //遍历初始化数据
    for (NSDictionary *dic in array) {
        HelpCenterModel *data = [[HelpCenterModel alloc]initWithDictionary:dic];
        [_helpData addObject:data];
    }
    
    [self.myTableView registerNib:[UINib nibWithNibName:@"HelpCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}

#pragma mark- UITableView Delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _helpData.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HelpCenterModel *model = _helpData[indexPath.section];
    
    if (model.isShowMessage) {
        return model.messageHeight+30;
    }else
        return 0.5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    HelpCenterModel *model = _helpData[section];
    return 15+model.titleHeight+15;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    HelpCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.clipsToBounds = YES;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (!cell) {
        cell = [[HelpCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    HelpCenterModel *model = _helpData[indexPath.section];
    
    cell.messageLabel.frame = CGRectMake(15, 0, Main_Screen_Width-30, model.messageHeight);
    cell.messageLabel.text = model.message;
    
    return cell;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HelpCenterModel *model = _helpData[section];
    
    HelpView *view = [[HelpView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 15+model.titleHeight+15) WithModel:model];
    view.backButton.tag = section;
    view.backgroundColor = [UIColor whiteColor];
    view.clipsToBounds = YES;
    [view.backButton addTarget:self action:@selector(showMessageView:) forControlEvents:UIControlEventTouchUpInside];
    
    return view;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 0)];
    view.backgroundColor = [UIColor whiteColor];
    view.clipsToBounds = YES;
    return view;
}

#pragma mark- 展示列表
-(void)showMessageView:(UIButton*)sender
{
    HelpCenterModel *model = _helpData[sender.tag];
    HelpView *view = (HelpView*)sender.superview;
    
    if (model.isShowMessage) {
        
        model.isShowMessage = NO;
        
        [self.myTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:sender.tag]] withRowAnimation:UITableViewRowAnimationTop];
        [UIView animateWithDuration:0.3 animations:^{
            view.noticeImageView.transform = CGAffineTransformIdentity;
        }];
    }
    else
    {
        model.isShowMessage = YES;
        
        [self.myTableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:sender.tag]] withRowAnimation:UITableViewRowAnimationBottom];
        [UIView animateWithDuration:0.3 animations:^{
            view.noticeImageView.transform = CGAffineTransformMakeRotation(M_PI_4);
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
