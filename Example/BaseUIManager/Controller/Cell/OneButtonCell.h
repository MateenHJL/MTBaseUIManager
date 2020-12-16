//
//  OneButtonCell.h
//  YouSuHuoPinDot
//
//  Created by Teen Ma on 2017/11/7.
//  Copyright © 2017年 Teen Ma. All rights reserved.
//

#import "BaseTableViewCell.h"

@class OneButtonViewModel;

@protocol OneButtonCellDelegate;

@interface OneButtonCell : BaseTableViewCell

@property (nonatomic, strong) UIButton *button;

@end

@protocol OneButtonCellDelegate <NSObject>

- (void)oneButtonCell:(OneButtonCell *)cell clickButtonWithViewModel:(OneButtonViewModel *)viewModel;

@end
