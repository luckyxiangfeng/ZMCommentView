//
//  UIView+Layout.h
//  hopscotch
//
//  Created by Kennith.Zeng on 11/24/14.
//  Copyright (c) 2014 Kennith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (QJLayout)

@property (assign, nonatomic) CGFloat frameX;
@property (assign, nonatomic) CGFloat frameY;
@property (assign, nonatomic) CGFloat frameWidth;
@property (assign, nonatomic) CGFloat frameHeight;
@property (assign, nonatomic) CGFloat centerX;
@property (assign, nonatomic) CGFloat centerY;
@property (assign, nonatomic) CGSize  frameSize;
@property (assign, nonatomic) CGPoint origin;

@property (assign, nonatomic) CGFloat top;
@property (assign, nonatomic) CGFloat bottom;
@property (assign, nonatomic) CGFloat right;
@property (assign, nonatomic) CGFloat left;

@end
