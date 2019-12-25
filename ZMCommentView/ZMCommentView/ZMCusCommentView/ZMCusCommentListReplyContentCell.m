//
//  ZMCusCommentListReplyContentCell.m
//  ZM
//
//  Created by Kennith.Zeng on 2018/8/29.
//  Copyright © 2018年 Kennith. All rights reserved.
//

#import "ZMCusCommentListReplyContentCell.h"
#import "NSString+Size.h"
@interface ZMCusCommentListReplyContentCell()
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UIImageView *designerImageView;
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UILabel *contentLab;
@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) UIImageView *lineImageView;
@property (nonatomic, strong) UILabel *replyNameLab;
@property (nonatomic, strong) UILabel *replyContentLab;
@end

@implementation ZMCusCommentListReplyContentCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self layoutUI];
    }
    return self;
}

- (void)layoutUI{

    
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc] init];
        [_headImageView setImage:[UIImage imageNamed:@"head_list_small"]];
        [self.contentView addSubview:_headImageView];
        [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(14);
            make.top.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(18, 18));
        }];
    }
    if (!_timeLab) {
        _timeLab = [[UILabel alloc] init];
        _timeLab.textColor = RGBHexColor(0x999999, 1);
        _timeLab.font = [UIFont systemFontOfSize:11];
        _timeLab.textAlignment = NSTextAlignmentRight;
        _timeLab.numberOfLines = 1;
        _timeLab.backgroundColor = [UIColor clearColor];
        [_timeLab sizeToFit];
        [self.contentView addSubview:_timeLab];
        [_timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-14);
            make.centerY.mas_equalTo(_headImageView);
            make.width.mas_offset(80);
            
        }];
    }
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.textColor = RGBHexColor(0x333333, 1);
        _titleLab.font = [UIFont boldSystemFontOfSize:14];
        _titleLab.numberOfLines = 1;
        _titleLab.backgroundColor = [UIColor clearColor];
        [_titleLab sizeToFit];
        [self.contentView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_headImageView.mas_right).mas_offset(7);
            make.centerY.mas_equalTo(_headImageView);
            make.height.mas_offset(20);
            
        }];
    }
    if (!_designerImageView) {
        _designerImageView = [[UIImageView alloc] init];
        [_designerImageView setBackgroundColor:[UIColor redColor]];
        [self.contentView addSubview:_designerImageView];
        [_designerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_titleLab.mas_right).mas_offset(7);
            make.centerY.mas_equalTo(_headImageView);
            make.size.mas_equalTo(CGSizeMake(31, 10));
        }];
    }
    
    if (!_contentLab) {
        _contentLab = [[UILabel alloc] init];
        _contentLab.textColor = RGBHexColor(0x333333, 1);
        _contentLab.font = [UIFont systemFontOfSize:14];
        _contentLab.numberOfLines = 0;
        _contentLab.backgroundColor = [UIColor clearColor];
        [_contentLab sizeToFit];
        [self.contentView addSubview:_contentLab];
        [_contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_titleLab);
            make.top.mas_equalTo(_titleLab.mas_bottom).mas_offset(10);
            make.right.mas_equalTo(-14);
            
        }];
    }

    if (!_replyNameLab) {
        _replyNameLab = [[UILabel alloc] init];
        _replyNameLab.textColor = RGBA(102, 102, 102, 1);
        _replyNameLab.font = [UIFont systemFontOfSize:13];
        _replyNameLab.numberOfLines = 1;
        _replyNameLab.backgroundColor = [UIColor clearColor];
        [_replyNameLab sizeToFit];
        [self.contentView addSubview:_replyNameLab];
        [_replyNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_contentLab.mas_left).mas_offset(11);
            make.top.mas_equalTo(_contentLab.mas_bottom).mas_offset(14);
            make.right.mas_equalTo(-14);
            make.height.mas_offset(15);
            
        }];
    }
    if (!_replyContentLab) {
        _replyContentLab = [[UILabel alloc] init];
        _replyContentLab.textColor = RGBA(102, 102, 102, 1);
        _replyContentLab.font = [UIFont systemFontOfSize:13];
        _replyContentLab.numberOfLines = 0;
        _replyContentLab.backgroundColor = [UIColor clearColor];
        [_replyContentLab sizeToFit];
        [self.contentView addSubview:_replyContentLab];
        [_replyContentLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_contentLab.mas_left).mas_offset(11);
            make.top.mas_equalTo(_replyNameLab.mas_bottom).mas_offset(3);
            make.right.mas_equalTo(-14);
            make.bottom.mas_equalTo(-10);
            
        }];
    }
    if (!_lineImageView) {
        _lineImageView = [[UIImageView alloc] init];
        [_lineImageView setBackgroundColor:RGBA(228, 228, 228, 1)];
        [self.contentView addSubview:_lineImageView];
        [_lineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_titleLab.mas_left).mas_offset(-1);
            make.width.mas_offset(1);
            make.top.mas_equalTo(_contentLab.mas_bottom).mas_offset(16);
            make.height.mas_offset(0);
        }];
    }

    
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
- (void)configData:(id)data{
    self.titleLab.text = @"愤怒的小栗子";
    self.timeLab.text = @"11分钟前";
    self.contentLab.text = @"不错挺好的，现在开始还来得及。只不过从某种意上讲事情没有这么简单。";
    self.replyNameLab.text = @"@小栗子";
    self.replyContentLab.text = @"不错挺好的，现在开始还来得及。只不过从某种意上讲事情没有这么简单";
    CGFloat titleWidth = [self.titleLab.text widthWithFont:[UIFont boldSystemFontOfSize:14] constrainedToHeight:20]+5;
    if (titleWidth>100) {
        titleWidth = 100;
    }
    [self.titleLab mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(titleWidth);
    }];
    
    CGFloat contentHeight =[self.contentLab.text heightWithFont:[UIFont systemFontOfSize:13] constrainedToWidth:SCREEN_WIDTH-28-7-18-12];
    [self.lineImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_offset(15+contentHeight);
    }];

}

//-(CGFloat)getViewHeightWithText:(NSString *)text font:(UIFont *)font width:(CGFloat)width{
//    if (text.length>0) {
//        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
//        label.font = font;
//        label.numberOfLines = 0;
//        label.text = text;
//        [label sizeToFit];
//        return CGRectGetHeight(label.frame);
//    }
//    return 0;
//}

@end
