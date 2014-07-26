//
//  YYMultipleButtonScrollView.m
//  YYFloatMenuView
//
//  Created by Yuan-Yi Chang on 2014/7/14.
//  Copyright (c) 2014年 Yuan-Yi Chang. All rights reserved.
//

#import "YYMultipleButtonScrollView.h"

@interface YYMultipleButtonScrollView()

@property (nonatomic, strong) NSMutableArray *buttonArray;
@property (nonatomic, assign) CGSize pageContentSize;

@end

@implementation YYMultipleButtonScrollView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.MaxColumnCount = 3;
        self.MaxRowCount = 3;
        self.padding = 10;
        self.buttonPadding = 5;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.clipsToBounds = YES;
        self.scrollEnabled = YES;
        self.pagingEnabled = YES;
    }
    return self;
}

- (UIPageControl *)pageControl
{
    if (!_pageControl)
        _pageControl = [[UIPageControl alloc] init];
    return _pageControl;
}

- (NSMutableArray *)buttonArray
{
    if (!_buttonArray)
        _buttonArray = [[NSMutableArray alloc] init];
    return _buttonArray;
}

- (void)setPage:(int)page
{
    self.contentOffset = CGPointMake(self.pageContentSize.width * page, 0);
}

- (void)handleButtons
{
    CGSize btnSize = CGSizeMake( (self.frame.size.width - (self.MaxColumnCount - 1) * self.buttonPadding -  2*self.padding) / self.MaxColumnCount, (self.frame.size.height - (self.MaxRowCount - 1) * self.buttonPadding - 2*self.padding) / self.MaxRowCount);
    
    int page = 0;
    for (int i=0; i<[self.buttonArray count]; ++i) {
        [self.buttonArray[i] removeFromSuperview];
        
        if ([self.buttonArray[i] isKindOfClass:[UIButton class]]) {
            UIButton *btn = self.buttonArray[i];
            if (self.buttonSkipConditionOn && self.buttonSkipWhenTagValueIs == btn.tag)
                continue;
            int row =  (i / self.MaxColumnCount) % self.MaxRowCount;
            int column = i % self.MaxColumnCount;
            page = i / ( self.MaxRowCount * self.MaxColumnCount );
            btn.frame = CGRectMake(self.padding + page * self.frame.size.width  + column * (self.buttonPadding + btnSize.width), self.padding + row * (self.buttonPadding + btnSize.height), btnSize.width, btnSize.height);
            [self addSubview:btn];
        }
    }
    self.pageContentSize = CGSizeMake( self.MaxColumnCount * btnSize.width + self.padding * 2 + (self.MaxColumnCount - 1) * self.buttonPadding, self.padding * 2 + (self.MaxRowCount - 1) * self.buttonPadding + self.MaxRowCount * btnSize.height );
    
    self.contentSize = CGSizeMake(self.pageContentSize.width * (page + 1), self.pageContentSize.height);
    self.pageControl.numberOfPages = page + 1;
}

- (void)addButton:(UIButton *)buton
{
    [self.buttonArray addObject:buton];
    [self handleButtons];
}


@end
