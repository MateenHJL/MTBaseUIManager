//
//  UITableView+RegisterCellClass.h
//  YouShuLa
//
//  Created by Teen Ma on 2018/6/14.
//  Copyright © 2018年 YouShuLa_IOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (RegisterCellClass)

- (void)registerCellClass:(Class)tableviewCell;

- (void)registerCellWithViewModels:(NSMutableArray *)viewModels;

@end
