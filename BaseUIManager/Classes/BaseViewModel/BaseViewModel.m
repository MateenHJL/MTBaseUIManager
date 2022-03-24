//
//  BaseViewModel.m
//  Express_ios
//
//  Created by Mateen on 16/3/28.
//  Copyright © 2016年 MaTeen. All rights reserved.
//

#import "BaseViewModel.h" 
#import "KVOItem.h"

@interface BaseViewModel ()

@property (nonatomic, strong  ) NSMutableArray *keyPaths;

@end

@implementation BaseViewModel

- (instancetype)init
{
    if (self = [super init])
    {
        self.cellLineViewModel = [[BaseCellLineViewModel alloc] init];
        self.currentCellHeight = 0.0;
        _cellIndentifier = @"";
        self.cellBackgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setCellClass:(id)cellClass
{
    if (cellClass)
    {
        _cellClass = cellClass;
        _cellIndentifier = NSStringFromClass([cellClass class]);
    }
}

- (NSMutableArray *)keyPaths
{
    if (!_keyPaths)
    {
        _keyPaths = [NSMutableArray array];
    }
    return _keyPaths;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (self.observerKeyPathChangedBlock)
    {
        self.observerKeyPathChangedBlock(self, keyPath, object);
    }
}

- (void)executeKVOWithItem:(KVOItem *)kvoItem
{
    if (!kvoItem.dataObserve || !kvoItem.uiObserve || kvoItem.uiKeyPaths.count == 0)
    {
        return;
    }
    
    [self setUnbindCellBlock:^(id originViewModel, BaseTableViewCell *cell) {
        for (NSString *keyPath in kvoItem.uiKeyPaths)
        {
            [cell.KVOController unobserve:kvoItem.uiObserve keyPath:keyPath];
        }
    }];
    
    [self setBindCellBlock:^(id originViewModel, BaseTableViewCell *cell) {
        [cell.KVOController observe:kvoItem.uiObserve keyPaths:kvoItem.uiKeyPaths options:NSKeyValueObservingOptionNew context:nil];
    }];
    
    [self setObserverKeyPathChangedBlock:^(id originViewmodel, NSString *keyPath, id object) {
        if (kvoItem.keyPathObservedCallback)
        {
            kvoItem.keyPathObservedCallback(originViewmodel, keyPath, object);
        }
    }];
    
    if (kvoItem.needRetainKVO)
    {
        [self.KVOController observe:kvoItem.dataObserve keyPaths:kvoItem.dataKeyPaths options:NSKeyValueObservingOptionNew context:nil];
    }
    else
    {
        [self.KVOControllerNonRetaining observe:kvoItem.dataObserve keyPaths:kvoItem.dataKeyPaths options:NSKeyValueObservingOptionNew context:nil];
    }
}

- (void)dealloc
{
    
}

@end
