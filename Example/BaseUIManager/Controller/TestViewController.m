//
//  TestViewController.m
//  PureProject
//
//  Created by mateen on 2020/12/15.
//  Copyright © 2020 Mateen. All rights reserved.
//

#import "TestViewController.h"
#import <BaseUIManager/CommonFile.h>

#import "OneButtonViewModel.h"
#import "OneButtonCell.h"

#import "VirtualLineCell.h"
#import "VirtualLineViewModel.h"

#define MTWeakBlock(type)  __weak typeof(type) weak##type = type;

@interface TestViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView    *table;
@property (nonatomic, strong) NSMutableArray *viewModels;

@property (nonatomic, copy  ) NSString *testtitle;

@end

@implementation TestViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        self.testtitle = @"TestTest";
//        self.aa = YES;
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    for (BaseViewModel *viewModel in self.viewModels)
    {
        [viewModel.KVOController unobserveAll];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUIInterface];
    
    [self setupData];
}

- (void)setupData
{
    [self resetViewModel];
}

- (void)resetViewModel
{
    [self.viewModels removeAllObjects];
    
    if (1)
    {
        BaseViewModel *viewModel = [self virtualLineViewModel];
        [self.viewModels addObject:viewModel];
        if (1)
        {
            //如果有kVO
            KVOItem *item = [[KVOItem alloc] init];
            item.dataObserve = self;
            item.needRetainKVO = NO;
            item.dataKeyPaths = @[@"testtitle"];
            item.uiObserve = viewModel;
            item.uiKeyPaths = @[@"title"];
            [item setKeyPathObservedCallback:^(VirtualLineViewModel *  _Nonnull originViewModel, NSString * _Nonnull keyPath, TestViewController *  _Nonnull object) {
                if ([keyPath isEqualToString:@"testtitle"])
                {
                    originViewModel.title = object.testtitle;
                }
            }];
            [viewModel executeKVOWithItem:item];
//            [viewModel setUnbindCellBlock:^(VirtualLineViewModel *originViewModel, BaseTableViewCell *cell) {
//                [cell.KVOController unobserve:originViewModel keyPath:@"title"];
//            }];
//
//            [viewModel setBindCellBlock:^(VirtualLineViewModel *originViewModel, BaseTableViewCell *cell) {
//                [cell.KVOController observe:originViewModel keyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
//            }];
//
//            [viewModel setObserverKeyPathChangedBlock:^(VirtualLineViewModel *viewModel, NSString *keyPath, TestViewController *object) {
//                if ([keyPath isEqualToString:@"testtitle"])
//                {
//                    viewModel.title = object.testtitle;
//                }
//            }];
//
//            [viewModel.KVOController observe:self keyPath:@"testtitle" options:NSKeyValueObservingOptionNew context:nil];
        }
        
        [self.viewModels addObject:[self oneButtonViewModelWithTitle:@"登录" backgroundColor:rgb(246, 246, 249) textColor:rgb(175, 177, 184) cellType:0 hasBoardColor:NO]];
    }
    else
    {
    }
    
    [self.table reloadData];
}

- (void)setupUIInterface
{
    self.title = @"TESt";
    
    self.table                 = [KitFactory tableView];
    self.table.delegate        = self;
    self.table.dataSource      = self;
    self.table.frame           = CGRectMake(0,  200, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:self.table];
    
    
    [self.table registerClass:[VirtualLineCell class] forCellReuseIdentifier:@"VirtualLineCell"];
    [self.table registerClass:[OneButtonCell class] forCellReuseIdentifier:@"OneButtonCell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseViewModel *viewModel = self.viewModels[indexPath.row];
    BaseTableViewCell *cell  = [self.table dequeueReusableCellWithIdentifier:viewModel.cellIndentifier];
    cell.delegate = self;
    [cell resetCellWithViewModel:viewModel];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseViewModel *viewModel    = self.viewModels[indexPath.row];
    if (viewModel.currentCellHeight == 0)
    {
        viewModel.currentCellHeight = [viewModel.cellClass currentCellHeightWithViewModel:viewModel];
    }
    return viewModel.currentCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseViewModel *viewModel    = self.viewModels[indexPath.row];
    
}

#pragma mark lazyInit
- (NSMutableArray *)viewModels
{
    if (!_viewModels)
    {
        _viewModels = [NSMutableArray array];
    }
    return _viewModels;
}
 
- (BaseViewModel *)oneButtonViewModelWithTitle:(NSString *)title backgroundColor:(UIColor *)bgColor textColor:(UIColor *)textColor cellType:(NSInteger)cellType hasBoardColor:(BOOL)hasBoardColor
{
    OneButtonViewModel *viewModel = [[OneButtonViewModel alloc] init];
    viewModel.buttonTitle = title;
    viewModel.buttonBackgroundColor = rgb(246, 246, 249);
    viewModel.cellClass = [OneButtonCell class];
    viewModel.currentCellHeight = 50;
    viewModel.font = [UIFont boldSystemFontOfSize:kAdjustFont(16)];
    viewModel.cornerRadius = 25;
    viewModel.space = 50;
    viewModel.textColor = rgb(175, 177, 184);
    viewModel.canTouch = YES;
    viewModel.cellType = cellType;
    return viewModel;
}

- (BaseViewModel *)virtualLineViewModel
{
    VirtualLineViewModel *viewModel = [[VirtualLineViewModel alloc] init];
    viewModel.currentCellHeight = 30;
    viewModel.title = self.testtitle;
    viewModel.cellClass = [VirtualLineCell class];
    return viewModel;
}

- (void)oneButtonCell:(OneButtonCell *)cell clickButtonWithViewModel:(OneButtonViewModel *)viewModel;
{
    if (!self.aa)
    {
        TestViewController *viewController = [[TestViewController alloc] init];
        viewController.aa = YES;
        [self.navigationController pushViewController:viewController animated:YES];

    }
    else
    {
        self.testtitle = [NSString stringWithFormat:@"%@",[NSDate date].description];
    }
}

- (void)dealloc
{
    
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
