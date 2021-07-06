//
//  TableViewController.m
//  BaseUIManager_Example
//
//  Created by Sumansoul on 2021/7/6.
//  Copyright © 2021 455528514@qq.com. All rights reserved.
//

#import "TableViewController.h"
#import <BaseUIManager/BaseTableManager.h>

#import "OneButtonViewModel.h"
#import "OneButtonCell.h"

#import "VirtualLineCell.h"
#import "VirtualLineViewModel.h"

#import <BaseUIManager/SimpleTableViewManage.h>
#import <BaseUIManager/GroupTableViewManager.h>
@interface TableViewController ()
{
    GroupTableViewManager *manager;
//    SimpleTableViewManage *manager;
}
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    manager = [[SimpleTableViewManage alloc] initWithTarget:self];
    
    manager = [[GroupTableViewManager alloc] initWithTarget:self];
    
    manager.table.frame = CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height - 88);
    [manager setDidSelectBlock:^(BaseTableManager * _Nonnull tableViewManager, UITableView * _Nonnull table, NSIndexPath * _Nonnull indexPath, BaseViewModel * _Nullable sectionViewModel, BaseViewModel * _Nonnull rowViewModel) {
    }];
    [manager setWillDisplayCellBlock:^(BaseTableManager * _Nonnull tableViewManager, UITableView * _Nonnull table, BaseTableViewCell * _Nonnull cell, NSIndexPath * _Nonnull indexPath) {
            
    }];
    [self.view addSubview:manager.table];
        
    NSMutableArray *viewModels = [NSMutableArray array];
//    [viewModels addObject:[self virtualLineViewModel]];
//    [viewModels addObject:[self oneButtonViewModelWithTitle:[NSString stringWithFormat:@"测试1"] backgroundColor:rgb(51, 51, 51) textColor:rgb(51, 5, 15) cellType:0 hasBoardColor:NO superViewModel:nil]];
    
    BaseViewModel *tmp = [[BaseViewModel alloc] init];
    tmp.subViewModelArray = [NSMutableArray array];
    [tmp.subViewModelArray addObject:[self oneButtonViewModelWithTitle:[NSString stringWithFormat:@"测试头"] backgroundColor:[UIColor redColor] textColor:rgb(255, 255, 255) cellType:0 hasBoardColor:YES superViewModel:tmp]];
    [viewModels addObject:tmp];
    
    for (int i = 0 ; i < 10 ; i++)
    {
        BaseViewModel *viewModel = [[BaseViewModel alloc] init];
        viewModel.subViewModelArray = [NSMutableArray array];
        [viewModel.subViewModelArray addObject:[self oneButtonViewModelWithTitle:[NSString stringWithFormat:@"测试%ld",i] backgroundColor:[UIColor redColor] textColor:rgb(255, 255, 255) cellType:0 hasBoardColor:YES superViewModel:viewModel]];
        [viewModel.subViewModelArray addObject:[self virtualLineViewModel]];
        [viewModels addObject:viewModel];
    }
    [manager reloadDataWithViewModel:viewModels];
    // Do any additional setup after loading the view.
}

- (BaseViewModel *)oneButtonViewModelWithTitle:(NSString *)title backgroundColor:(UIColor *)bgColor textColor:(UIColor *)textColor cellType:(NSInteger)cellType hasBoardColor:(BOOL)hasBoardColor superViewModel:(id)dataModel
{
    OneButtonViewModel *viewModel = [[OneButtonViewModel alloc] init];
    viewModel.buttonTitle = title;
    viewModel.superViewModel = dataModel;
    viewModel.buttonBackgroundColor = rgb(246, 246, 249);
    viewModel.cellClass = [OneButtonCell class];
    viewModel.currentCellHeight = 50;
    viewModel.font = [UIFont boldSystemFontOfSize:kAdjustFont(16)];
    viewModel.cornerRadius = 25;
    viewModel.space = 50;
    viewModel.textColor = rgb(175, 177, 184);
    viewModel.canTouch = YES;
    viewModel.cellType = cellType;
    viewModel.dataModel = @"Mateen";
    return viewModel;
}

- (BaseViewModel *)virtualLineViewModel
{
    VirtualLineViewModel *viewModel = [[VirtualLineViewModel alloc] init];
    viewModel.currentCellHeight = 30;
    viewModel.title = @"哈哈";
    viewModel.cellClass = [VirtualLineCell class];
    return viewModel;
}

- (void)oneButtonCell:(OneButtonCell *)cell clickButtonWithViewModel:(OneButtonViewModel *)viewModel;
{
    NSInteger index = NSNotFound;
    for (int i = 0 ; i < manager.viewModels.count; i++)
    {
        BaseViewModel *tmp = manager.viewModels[i];
        if (tmp == viewModel.superViewModel)
        {
            index = i;
            break;
        }
    }
    [manager.viewModels removeObject:viewModel.superViewModel];
    [manager reloadDataWithViewModel:manager.viewModels];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
