//
//  YYFloatView.h
//  YYFloatMenuView
//
//  Created by Yuan-Yi Chang on 2014/7/14.
//  Copyright (c) 2014年 Yuan-Yi Chang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYFloatView : UIView

@property (nonatomic, assign) CGPoint beginPoint;
@property (nonatomic, assign) CGFloat padding;
@property (nonatomic, assign) BOOL locked;
@property (nonatomic, assign) BOOL dragEnable;
@property (nonatomic, assign) BOOL adsorbEnable;
@property (nonatomic, assign) int maxWidth;
@property (nonatomic, assign) int maxHeight;

@end