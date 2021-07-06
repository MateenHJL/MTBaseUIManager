//
//  GroupTableViewManager.m
//  BaseUIManager
//
//  Created by Sumansoul on 2021/7/6.
//

#import "GroupTableViewManager.h"
#import "BaseViewModel.h"
#import "UITableView+RegisterCellClass.h"

@interface GroupTableViewManager ()   <UITableViewDelegate,UITableViewDataSource>

@end

@implementation GroupTableViewManager

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
    for (int i = 0 ; i < self.viewModels.count; i++)
    {
        BaseViewModel *viewModel = self.viewModels[i];
        if (viewModel.subViewModelArray && viewModel.subViewModelArray.count > 0)
        {
            //group viewModels
            for (int j = 0 ; j < viewModel.subViewModelArray.count; j++)
            {
                BaseViewModel *subViewModel = viewModel.subViewModelArray[j];
                [_table registerCellWithViewModels:[NSMutableArray arrayWithObject:subViewModel]];
            }
        }
    }
    [_table reloadData];
}
 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.viewModels.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    BaseViewModel *viewModel = self.viewModels[section];
    return viewModel.subViewModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseViewModel *model = self.viewModels[indexPath.section];
    BaseViewModel *viewModel = model.subViewModelArray[indexPath.row];
    BaseTableViewCell *cell  = [self.table dequeueReusableCellWithIdentifier:viewModel.cellIndentifier];
    cell.delegate = self.target;
    [cell resetCellWithViewModel:viewModel];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseViewModel *model = self.viewModels[indexPath.section];
    BaseViewModel *viewModel = model.subViewModelArray[indexPath.row];
    if (viewModel.currentCellHeight == 0)
    {
        viewModel.currentCellHeight = [viewModel.cellClass currentCellHeightWithViewModel:viewModel];
    }
    return viewModel.currentCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseViewModel *model = self.viewModels[indexPath.section];
    BaseViewModel *viewModel = model.subViewModelArray[indexPath.row];
    if (self.didSelectBlock)
    {
        self.didSelectBlock(self ,tableView, indexPath, model, viewModel);
    }
}

@end
