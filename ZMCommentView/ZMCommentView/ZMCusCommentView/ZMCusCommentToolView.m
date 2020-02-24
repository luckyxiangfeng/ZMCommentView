//
//  ZMCusCommentToolView.m
//  ZM
//
//  Created by Kennith.Zeng on 2018/8/29.
//  Copyright © 2018年 Kennith. All rights reserved.
//

#import "ZMCusCommentToolView.h"
#define MIN_TEXTVIEW_HEIGHT 36
#define MAX_TEXTVIEW_HEIGHT 76
@interface ZMCusCommentToolView()<UITextViewDelegate>
@property (nonatomic, strong) UIView *contentBgView;
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UIButton *sendBtn;

@end

@implementation ZMCusCommentToolView
- (instancetype)initWithFrame:(CGRect)frame{
    
    if ([super initWithFrame:frame]) {
        
        self.backgroundColor = RGBHexColor(0xffffff, 1);
        self.layer.shadowColor = RGBHexColor(0x000000, 1).CGColor;
        self.layer.shadowOffset = CGSizeMake(0, -1);
        self.layer.shadowOpacity = 0.1;
        self.layer.shadowRadius = 4;
        [self layoutUI];
 
    }
    return self;
}
- (void)layoutUI{
    
    CGFloat sendBtnY = self.frameWidth-40-9;
    
    _sendBtn = [[UIButton alloc] initWithFrame:CGRectMake(sendBtnY, 7, 40, 36)];
    [_sendBtn setTitleColor:RGBA(204, 204, 204, 1) forState:UIControlStateNormal];
    [_sendBtn setTitle:@"发送" forState:UIControlStateNormal];
    _sendBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [_sendBtn addTarget:self action:@selector(sendBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_sendBtn];

    _contentBgView = [[UIView alloc] initWithFrame:CGRectMake(14, 7, sendBtnY-13-14, MIN_TEXTVIEW_HEIGHT)];
    _contentBgView.backgroundColor = RGBA(241, 242, 244, 1);
    _contentBgView.layer.masksToBounds = YES;
    _contentBgView.layer.cornerRadius = MIN_TEXTVIEW_HEIGHT/2;
    [self addSubview:_contentBgView];

    _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(3,(self.contentBgView.frameHeight-31)/2 , 31, 31)];
    [_headImageView setImage:[UIImage imageNamed:@"head_list_small"]];
    [_contentBgView addSubview:_headImageView];

    _textView = [[ZMPlaceholderTextView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headImageView.frame)+3,(self.contentBgView.frameHeight-31)/2, self.contentBgView.frameWidth-self.sendBtn.frameWidth-9, MIN_TEXTVIEW_HEIGHT)];
    _textView.textAlignment = NSTextAlignmentLeft;
    _textView.font = [UIFont systemFontOfSize:14];
    _textView.returnKeyType = UIReturnKeyDone;
    _textView.delegate = self;
    _textView.textColor = RGBHexColor(0x333333, 1);
    _textView.placeholder = @"你也来聊两句吧";
    _textView.backgroundColor = [UIColor clearColor];
    _textView.showsVerticalScrollIndicator = NO;
    [_contentBgView addSubview:_textView];
    

}
- (void)showTextView{

    [self.textView becomeFirstResponder];
}
- (void)hideTextView{
    [self resetView];
    [self.textView resignFirstResponder];
}

- (void)sendBtnAction{
    if (self.sendBtnBlock) {
        self.sendBtnBlock(self.textView.text);
    }
    [self resetView];

}
- (void)resetView{
    
    self.sendBtn.frameY = 7;
    self.textView.text = nil;
    self.textView.placeholder = @"你也来聊两句吧";
    self.textView.frameHeight = MIN_TEXTVIEW_HEIGHT;
    self.contentBgView.frameHeight = MIN_TEXTVIEW_HEIGHT;
    self.sendBtn.userInteractionEnabled = NO;
    [self.sendBtn setTitleColor:RGBA(204, 204, 204, 1) forState:UIControlStateNormal];

}
#pragma mark - textviewDelegate

- (void)textViewDidChange:(UITextView *)textView{

    CGFloat width = CGRectGetWidth(textView.frame);
//    CGFloat height = CGRectGetHeight(textView.frame);
    CGSize newSize = [textView sizeThatFits:CGSizeMake(width,MAXFLOAT)];
    CGFloat newHeight = newSize.height;
    if (newHeight<MIN_TEXTVIEW_HEIGHT) {
        newHeight = MIN_TEXTVIEW_HEIGHT;
    }
    if (newHeight>=MAX_TEXTVIEW_HEIGHT) {
        newHeight = MAX_TEXTVIEW_HEIGHT;
    }
    self.frameHeight = newHeight+24;
    if (self.frameHeight>self.defaultHeight) {
        CGFloat changeOffsetY = self.frameHeight-self.defaultHeight;
        self.frameY =self.defaultY-self.frameHeight+self.defaultHeight;
        self.sendBtn.frameY = changeOffsetY+7;

    }else{
        self.frameY = self.defaultY;
        self.sendBtn.frameY = 7;

    }
    self.textView.frameHeight = newHeight;
    self.contentBgView.frameHeight = newHeight;

    if (textView.text.length>0) {
        self.sendBtn.userInteractionEnabled = YES;
        [self.sendBtn setTitleColor:RGBA(66, 189, 86, 1) forState:UIControlStateNormal];
    }else{
        self.sendBtn.userInteractionEnabled = NO;
        [self.sendBtn setTitleColor:RGBA(204, 204, 204, 1) forState:UIControlStateNormal];
    }

    if (self.changeTextBlock) {
        self.changeTextBlock(textView.text,self.frame);
    }
}

@end
