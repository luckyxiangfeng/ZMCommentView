//
//  ZMCusCommentBottomView.m
//  ZM
//
//  Created by Kennith.Zeng on 2018/8/29.
//  Copyright © 2018年 Kennith. All rights reserved.
//

#import "ZMCusCommentBottomView.h"
@interface ZMCusCommentBottomView()
@property (nonatomic, strong) UIImageView *headView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *tapBtn;
@end
@implementation ZMCusCommentBottomView
- (instancetype)initWithFrame:(CGRect)frame{
    
    if ([super initWithFrame:frame]) {
        self.backgroundColor = RGBHexColor(0xffffff, 1);
        [self layoutUI];
        
    }
    return self;
}
- (void)layoutUI{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"           你也来聊两句吧";
        _titleLabel.textColor = RGBA(153, 153, 153, 1);
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.backgroundColor = RGBA(241, 242, 244, 1);
        _titleLabel.layer.masksToBounds = YES;
        _titleLabel.layer.cornerRadius = 36/2;
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(14);
            make.right.mas_equalTo(-14);
            make.centerY.mas_equalTo(0);
            make.height.mas_offset(36);
        }];
    }
    if (!_headView) {
        _headView = [[UIImageView alloc] init];
        [_headView setImage:[UIImage imageNamed:@"head_list_small"]];
        [self addSubview:_headView];
        [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(17);
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(31, 31));
        }];
    }
    
    if (!_tapBtn) {
        _tapBtn = [[UIButton alloc] init];
        [_tapBtn addTarget:self action:@selector(tapBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [_tapBtn setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_tapBtn];
        [_tapBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(14);
            make.right.mas_equalTo(-14);
            make.height.mas_offset(36);
            make.centerY.mas_offset(0);
        }];
    }
    
}

- (void)tapBtnAction{
    self.tapBtn.enabled = NO;
    [self performSelector:@selector(changeButtonStatus) withObject:nil afterDelay:2.0f];//防止用户重复点击
    if (self.tapBtnBlock) {
        self.tapBtnBlock();
    }
}
-(void)changeButtonStatus{
    self.tapBtn.enabled = YES;
}




@end
