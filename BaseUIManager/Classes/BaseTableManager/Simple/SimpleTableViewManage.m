//
//  SimpleTableViewManage.m
//  BaseUIManager
//
//  Created by Sumansoul on 2021/7/6.
//

#import "SimpleTableViewManage.h"
#import "BaseViewModel.h"
#import "UITableView+RegisterCellClass.h"

@interface SimpleTableViewManage () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation SimpleTableViewManage

@synthesize viewModels = _viewModels;
@synthesize table = _table;
@synthesize target = _target;

- (instancetype)initWithTarget:(id)target
{
    if (self = [super initWithTarget:target])
    {
        _target = target;
        [self setupUIInterface];
    }
    return self;
}

- (void)setupUIInterface
{
    _table = [KitFactory tableView];
    _table.delegate = self;
    _table.dataSource = self;
}

- (void)reloadDataWithViewModel:(NSMutableArray<BaseViewModel *> *)viewModels
{
    NSAssert(viewModels != nil, @"the dataSource of tableView is nil");
    _viewModels = viewModels;
    [_table registerCellWithViewModels:_viewModels];
    [_table reloadData];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.willDisplayCellBlock)
    {
        self.willDisplayCellBlock(self, tableView, cell, indexPath);
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _viewModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseViewModel *viewModel = _viewModels[indexPath.row];
    if (viewModel.cellIndentifier.length > 0)
    {
        BaseTableViewCell *cell  = [_table dequeueReusableCellWithIdentifier:viewModel.cellIndentifier];
        cell.delegate = self.target;
        [cell resetCellWithViewModel:viewModel];
        return cell;
    }
    return [BaseTableViewCell new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseViewModel *viewModel    = _viewModels[indexPath.row];
    if (viewModel.currentCellHeight == 0)
    {
        viewModel.currentCellHeight = [viewModel.cellClass currentCellHeightWithViewModel:viewModel];
    }
    return viewModel.currentCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseViewModel *viewModel    = _viewModels[indexPath.row];
    if (self.didSelectBlock)
    {
        self.didSelectBlock(self, tableView, indexPath, nil, viewModel);
    }
}

- (void)reloadData
{
    [_table registerCellWithViewModels:_viewModels];
    [_table reloadData];
}

@end
