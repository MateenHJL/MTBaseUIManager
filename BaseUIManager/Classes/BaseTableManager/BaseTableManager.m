//
//  BaseTableManager.m
//  BaseUIManager
//
//  Created by Sumansoul on 2021/7/6.
//

#import "BaseTableManager.h"
#import "KitFactory.h"
#import "BaseViewModel.h"

@interface BaseTableManager ()
 
@end

@implementation BaseTableManager

@synthesize table = _table;
@synthesize viewModels = _viewModels;
@synthesize target = _target;

- (instancetype)initWithTarget:(id)target
{
    if (self = [super init])
    { 
        
    }
    return self;
}

- (void)reloadDataWithViewModel:(NSMutableArray<BaseViewModel *> *)viewModels
{
    
}

- (void)reloadData
{
    
}

@end
