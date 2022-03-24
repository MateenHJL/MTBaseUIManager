//
//  KVOItem.h
//  Pods
//
//  Created by CbtPower on 24.3.22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class KVOKeyPathItem;
@class BaseViewModel;

typedef void(^KVOKeyPathObservedCallback)(id originViewModel, NSString *keyPath, id object);

@interface KVOItem : NSObject

@property (nonatomic, assign) BOOL needRetainKVO;
@property (nonatomic, weak  ) id dataObserve;
@property (nonatomic, strong) NSArray <NSString *>*dataKeyPaths;
@property (nonatomic, copy  ) KVOKeyPathObservedCallback keyPathObservedCallback;
@property (nonatomic, weak  ) id uiObserve;
@property (nonatomic, strong) NSArray <NSString *>*uiKeyPaths;

@end

NS_ASSUME_NONNULL_END
