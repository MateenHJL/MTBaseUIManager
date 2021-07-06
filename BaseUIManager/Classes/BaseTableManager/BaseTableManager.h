//
//  BaseTableManager.h
//  BaseUIManager
//
//  Created by Sumansoul on 2021/7/6.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
 
@class BaseTableViewCell;
@class BaseViewModel;
@class BaseTableManager;

//didSelectRowAtIndexPath
typedef void(^BaseTableManagerDidSelectRowAtIndexPathBlock)(BaseTableManager *tableViewManager, UITableView *table, NSIndexPath *indexPath, BaseViewModel * _Nullable sectionViewModel, BaseViewModel *rowViewModel);

//WillDisplayCellBlock
typedef void(^BaseTableManagerWillDisplayCellBlock)(BaseTableManager *tableViewManager, UITableView *table, BaseTableViewCell *cell, NSIndexPath *indexPath);

@interface BaseTableManager : NSObject

@property (nonatomic, readonly  ) UITableView *table;
@property (nonatomic, readonly  ) NSMutableArray *viewModels;
@property (nonatomic, assign, readonly) id target;
@property (nonatomic, copy      ) BaseTableManagerDidSelectRowAtIndexPathBlock didSelectBlock;
@property (nonatomic, copy      ) BaseTableManagerWillDisplayCellBlock willDisplayCellBlock;

- (instancetype)initWithTarget:(id)target;

//the tableview will be reloaded depends on whatever the data is.
- (void)reloadDataWithViewModel:(NSMutableArray <BaseViewModel *> *)viewModels;

/*the tableview will be reloaded depends on whatever the data is.
    the address of data didn't been modified yet
 */
- (void)reloadData;

@end

NS_ASSUME_NONNULL_END
