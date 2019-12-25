//
//  ZMPlaceholderTextView.m
//  ZMCommentView
//
//  Created by Kennith.Zeng on 2018/8/30.
//  Copyright © 2018年 Kennith.Zeng. All rights reserved.
//

#import "ZMPlaceholderTextView.h"
static CGFloat const ANIMATION_DURATION = 0.25;
@interface ZMPlaceholderTextView ()

@property (nonatomic, strong) UILabel *placeHolderLabel;

@end

@implementation ZMPlaceholderTextView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setPlaceholder:@""];
        [self setPlaceholderColor:[UIColor lightGrayColor]];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

- (void)textChanged:(NSNotification *)notification
{
    if([[self placeholder] length] == 0)
    {
        return;
    }
    
    [UIView animateWithDuration:ANIMATION_DURATION animations:^{
        if([[self text] length] == 0)
        {
            [[self viewWithTag:999] setAlpha:1];
        }
        else
        {
            [[self viewWithTag:999] setAlpha:0];
        }
    }];
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self textChanged:nil];
}

- (void)setPlaceholder:(NSString *)placeholder{
    
    _placeholder = placeholder;
    self.placeHolderLabel.text = placeholder;

    CGSize size = [_placeHolderLabel sizeThatFits:CGSizeMake(self.bounds.size.width - 16, 0)];
    self.placeHolderLabel.frameHeight = size.height;
}
- (void)drawRect:(CGRect)rect
{
    if( [[self placeholder] length] > 0 )
    {
        if (_placeHolderLabel == nil )
        {
            _placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(8,7,self.bounds.size.width - 16,0)];
            _placeHolderLabel.lineBreakMode   = NSLineBreakByWordWrapping;
            _placeHolderLabel.numberOfLines   = 0;
            _placeHolderLabel.font            = self.font;
            _placeHolderLabel.backgroundColor = [UIColor clearColor];
            _placeHolderLabel.textColor       = self.placeholderColor;
            _placeHolderLabel.alpha           = 0;
            _placeHolderLabel.tag             = 999;
            [self addSubview:_placeHolderLabel];
        }
        
        _placeHolderLabel.text = self.placeholder;
        CGSize size = [_placeHolderLabel sizeThatFits:CGSizeMake(self.bounds.size.width - 16, 0)];
        _placeHolderLabel.frameHeight = size.height;
        [self sendSubviewToBack:_placeHolderLabel];
    }
    
    if( [[self text] length] == 0 && [[self placeholder] length] > 0 )
    {
        [[self viewWithTag:999] setAlpha:1];
    }
    
    [super drawRect:rect];
}

@end
