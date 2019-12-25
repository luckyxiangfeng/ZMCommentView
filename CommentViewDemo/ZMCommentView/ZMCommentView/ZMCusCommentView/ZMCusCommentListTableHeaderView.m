//
//  ZMCusCommentListTableHeaderView.m
//  ZM
//
//  Created by Kennith.Zeng on 2018/8/29.
//  Copyright © 2018年 Kennith. All rights reserved.
//

#import "ZMCusCommentListTableHeaderView.h"
@interface ZMCusCommentListTableHeaderView ()
@property (nonatomic, strong) UIButton *closeBtn;
@property (nonatomic, strong) UILabel *titleLabel;
@end;
@implementation ZMCusCommentListTableHeaderView
- (instancetype)initWithFrame:(CGRect)frame{
    
    if ([super initWithFrame:frame]) {
        self.backgroundColor = RGBHexColor(0xffffff, 1);
        [self layoutUI];
        
    }
    return self;
}
- (void)layoutUI{
    if (!_closeBtn) {
        UIImage *image = [UIImage imageNamed:@"inspiration_close_btn"];
        _closeBtn = [[UIButton alloc] init];
        [_closeBtn setImage:image forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(clostBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_closeBtn];
        [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-14);
            make.top.mas_equalTo(27);
            make.size.mas_equalTo(CGSizeMake(12, 12));
        }];
    }

    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:15];
        _titleLabel.textColor = RGBHexColor(0x333333, 1);
        _titleLabel.text = @"全部评论";
        _titleLabel.numberOfLines = 1;
        _titleLabel.backgroundColor = [UIColor clearColor];
        [_titleLabel sizeToFit];
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(14);
            make.top.mas_equalTo(25);
            make.right.mas_equalTo(_closeBtn.mas_left).mas_offset(-14);
        }];
    }
    
    

    
}
- (void)clostBtnAction{
    
    if (self.closeBtnBlock) {
        self.closeBtnBlock();
    }
    
}
@end
