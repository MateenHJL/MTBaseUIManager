//
//  VirtualLineCell.m
//  MaoShiIOS
//
//  Created by mateen on 2020/11/10.
//  Copyright © 2020 Mateen. All rights reserved.
//

#import "VirtualLineCell.h"
#import "VirtualLineViewModel.h"

@interface VirtualLineCell ()

@property (nonatomic, strong) VirtualLineViewModel *viewModel;
@property (nonatomic, strong) UILabel              *label;

@end

@implementation VirtualLineCell

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
    [self lazyInitAllSubViewUIWithAutolayoutEnable:YES];
    
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.font = [UIFont systemFontOfSize:26];
    self.label.textColor = rgb(241, 237, 234);
    self.label.lineBreakMode = NSLineBreakByClipping;
    [self.contentView addSubview:self.label];
     
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[_label]-50-|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(_label)]];
}

- (void)resetCellWithViewModel:(VirtualLineViewModel *)model
{
    [super resetCellWithViewModel:model];
    self.viewModel = model;
    self.label.text = model.title;
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
