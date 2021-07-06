//
//  UITableView+RegisterCellClass.m
//  YouShuLa
//
//  Created by Teen Ma on 2018/6/14.
//  Copyright © 2018年 YouShuLa_IOS. All rights reserved.
//

#import "UITableView+RegisterCellClass.h"
#import "BaseViewModel.h"

@implementation UITableView (RegisterCellClass)

- (void)registerCellWithViewModels:(NSMutableArray *)viewModels
{
    if (!viewModels)
    {
        NSLog(@"注册cell失败，viewModel为nil");
        return;
    }
    
    for (id viewModel in viewModels)
    {
        if ([viewModel isKindOfClass:[BaseViewModel class]])
        {
            BaseViewModel *originViewModel = viewModel;
            if (originViewModel.cellClass)
            {
                NSString *cellClassString = NSStringFromClass(originViewModel.cellClass);
                if (cellClassString && cellClassString.length > 0)
                {
                    if (![self dequeueReusableCellWithIdentifier:cellClassString])
                    {
                        //cell didnt be registered
                        [self registerCellClass:originViewModel.cellClass];
                    }
                }
            }
        }
    }
}

- (void)registerCellClass:(Class)tableviewCell
{
    [self registerClass:[tableviewCell class] forCellReuseIdentifier:NSStringFromClass([tableviewCell class])];
}

@end
