//
//  OneButtonCell.m
//  YouSuHuoPinDot
//
//  Created by Teen Ma on 2017/11/7.
//  Copyright © 2017年 Teen Ma. All rights reserved.
//

#import "OneButtonCell.h"
#import "OneButtonViewModel.h"
#import "UIColor+ChameleonPrivate.h"
#import "UIColor+Chameleon.h"

@interface OneButtonCell ()

@property (nonatomic, strong) OneButtonViewModel *viewModel;

@end

@implementation OneButtonCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setupUIInterface];
    }
    return self;
}

- (void)setupUIInterface
{
    self.backgroundColor = [UIColor clearColor];
    
    [self.contentView addSubview:self.button];
}

- (void)resetCellWithViewModel:(OneButtonViewModel *)model
{
    self.viewModel = model;
 
    self.backgroundColor = model.cellBackgroundColor;
    
    self.button.backgroundColor = model.buttonBackgroundColor;
    
    [self.button setTitleColor:model.textColor forState:UIControlStateNormal];
    self.button.layer.cornerRadius = model.cornerRadius;
    self.button.layer.borderColor = model.boardColor.CGColor;
    self.button.layer.borderWidth = model.boardWidth;
    self.button.titleLabel.font = model.font;
    [self.button setTitle:model.buttonTitle forState:UIControlStateNormal];
    
    if (model.canTouch)
    {
        [self.button addTarget:self action:@selector(respondsToButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    else
    {
        [self.button removeTarget:self action:@selector(respondsToButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (self.viewModel.buttonWidth > 0)
    {
        self.button.frame = CGRectMake(0 , 0 ,  self.viewModel.buttonWidth, self.viewModel.currentCellHeight);
        self.button.center = CGPointMake(model.superViewWdith / 2, self.button.center.y);
    }
    else
    {
        self.button.frame = CGRectMake(self.viewModel.space, 0, model.superViewWdith - self.viewModel.space * 2, self.viewModel.currentCellHeight);
    }
    
    if (self.viewModel.hasAnimation)
    {
        [UIView animateWithDuration:0.3 animations:^{
            NSArray* colors = self.viewModel.colors;
            if (self.viewModel.isGradientStyle)
            {
                self.button.backgroundColor = [UIColor colorWithGradientStyle:UIGradientStyleLeftToRight withFrame:self.button.bounds andColors:colors];
            }
            else
            {
                self.button.backgroundColor = self.viewModel.buttonBackgroundColor;
            }
        }];
    }
    else
    {
        if (self.viewModel.isGradientStyle)
        {
            NSArray* colors = self.viewModel.colors;
            self.button.backgroundColor = [UIColor colorWithGradientStyle:UIGradientStyleLeftToRight withFrame:self.button.bounds andColors:colors];
        }
        else
        {
            self.button.backgroundColor = self.viewModel.buttonBackgroundColor;
        }
    }
}

- (void)respondsToButton:(UIButton *)button
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(oneButtonCell:clickButtonWithViewModel:)])
    {
        [self.delegate oneButtonCell:self clickButtonWithViewModel:self.viewModel];
    }
}

- (UIButton *)button
{
    if (!_button)
    {
        _button = [KitFactory button];
        _button.layer.masksToBounds = YES;
    }
    return _button;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
