//
//  OneButtonViewModel.h
//  YouSuHuoPinDot
//
//  Created by Teen Ma on 2017/11/7.
//  Copyright © 2017年 Teen Ma. All rights reserved.
//

#import "BaseViewModel.h"

@interface OneButtonViewModel : BaseViewModel

@property (nonatomic, copy  ) NSString *buttonTitle;
@property (nonatomic, assign) float   space;
@property (nonatomic, strong) UIColor *buttonBackgroundColor;
@property (nonatomic, assign) float   buttonWidth;//与Space 只有一个值 当A有值 另一个必为0
@property (nonatomic, assign) float   cornerRadius;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, assign) float   boardWidth;
@property (nonatomic, strong) UIColor *boardColor;
@property (nonatomic, strong) UIFont  *font;
@property (nonatomic, assign) BOOL    canTouch;
@property (nonatomic, assign) BOOL    hasAnimation;


@property (nonatomic, assign) BOOL    isGradientStyle;//是否是渐变颜色
@property (nonatomic, strong) NSArray *colors;

@property (nonatomic, assign) CGFloat superViewWdith;//参照位置

@end
