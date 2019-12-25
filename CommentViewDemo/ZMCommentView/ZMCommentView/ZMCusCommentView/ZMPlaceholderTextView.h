//
//  ZMPlaceholderTextView.h
//  ZMCommentView
//
//  Created by Kennith.Zeng on 2018/8/30.
//  Copyright © 2018年 Kennith.Zeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZMPlaceholderTextView : UITextView
@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) UIColor *placeholderColor;

-(void)textChanged:(NSNotification*)notification;
@end
