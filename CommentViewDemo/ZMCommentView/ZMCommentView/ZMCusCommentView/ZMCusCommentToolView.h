//
//  ZMCusCommentToolView.h
//  ZM
//
//  Created by Kennith.Zeng on 2018/8/29.
//  Copyright © 2018年 Kennith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZMPlaceholderTextView.h"
#define ZMCusCommentEditToolViewHeight 60
@interface ZMCusCommentToolView : UIView
@property (nonatomic, copy) void(^sendBtnBlock)(void);
@property (nonatomic, copy) void(^changeTextBlock)(NSString *text,CGRect frame);
@property (nonatomic, strong) ZMPlaceholderTextView *textView;
@property (nonatomic, assign) CGFloat keyboardHeight;
@property (nonatomic, assign) CGFloat defaultHeight;
@property (nonatomic, assign) CGFloat defaultY;
- (void)showTextView;
- (void)hideTextView;
- (void)resetView;
@end
