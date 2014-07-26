//
//  YYMultipleButtonScrollView.h
//  YYFloatMenuView
//
//  Created by Yuan-Yi Chang on 2014/7/14.
//  Copyright (c) 2014年 Yuan-Yi Chang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYMultipleButtonScrollView : UIScrollView

@property (nonatomic, assign) int MaxRowCount;
@property (nonatomic, assign) int MaxColumnCount;
@property (nonatomic, assign) int padding;
@property (nonatomic, assign) int buttonPadding;
@property (nonatomic, assign) bool buttonSkipConditionOn;
@property (nonatomic, assign) int buttonSkipWhenTagValueIs;

@property (nonatomic, strong) UIPageControl *pageControl;

- (void)setPage:(int)page;
- (void)addButton:(UIButton *)buton;
- (void)handleButtons;

@end
