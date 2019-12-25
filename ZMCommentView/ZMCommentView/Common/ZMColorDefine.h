//
//  ZMColorDefine.h
//  ZMCommentView
//
//  Created by Kennith.Zeng on 2018/8/29.
//  Copyright © 2018年 Kennith.Zeng. All rights reserved.
//

#define RGBHexColor(hexValue, alphaValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
// Views
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define STATUS_BAR_HEIGHT CGRectGetHeight([UIApplication sharedApplication].statusBarFrame)
#define NAV_BAR_HEIGHT 44
#define STATUS_AND_NAV_BAR_HEIGHT (STATUS_BAR_HEIGHT + NAV_BAR_HEIGHT)
//iPhone X底部边距
#define SAFE_AREA_BOTTOM (STATUS_BAR_HEIGHT > 20 ? 34.0 : 0.0)

// block
#define weakify(var) \
try {} @catch (...) {} \
__weak __typeof__(var) var ## _weak = var;


#define strongify(var) \
try {} @catch (...) {} \
__strong __typeof__(var) var = var ## _weak;
