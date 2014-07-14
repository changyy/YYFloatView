//
//  ViewController.m
//  YYFloatMenuView
//
//  Created by Yuan-Yi Chang on 2014/7/14.
//  Copyright (c) 2014年 Yuan-Yi Chang. All rights reserved.
//

#import "ViewController.h"
#import "YYFloatView.h"
#import "YYMultipleButtonScrollView.h"


@interface ViewController () <UIScrollViewDelegate, UIPageViewControllerDelegate>

@property (nonatomic, strong) YYFloatView* floatMenuView;
@property (nonatomic, strong) YYMultipleButtonScrollView* hotKeyScrollView;

@end

@implementation ViewController

- (YYFloatView *)floatMenuView
{
    if (!_floatMenuView) {
        _floatMenuView = [[YYFloatView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
        _floatMenuView.backgroundColor = [UIColor colorWithRed:0.7 green:0.6 blue:0.5 alpha:0.5];
        _floatMenuView.layer.cornerRadius = 5;
        _floatMenuView.padding = 15;
        _floatMenuView.dragEnable = YES;
        _floatMenuView.adsorbEnable = YES;
    }
    return _floatMenuView;
}

- (YYMultipleButtonScrollView *)hotKeyScrollView
{
    if (!_hotKeyScrollView) {
        _hotKeyScrollView = [[YYMultipleButtonScrollView alloc] init];
    }
    return _hotKeyScrollView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.hotKeyScrollView.frame = CGRectMake(self.hotKeyScrollView.padding, self.hotKeyScrollView.padding, self.floatMenuView.frame.size.width - 2*self.hotKeyScrollView.padding, self.floatMenuView.frame.size.height - 2*self.hotKeyScrollView.padding);
    
    self.hotKeyScrollView.pageControl.frame = CGRectMake(self.hotKeyScrollView.padding, self.hotKeyScrollView.padding + self.hotKeyScrollView.frame.size.height, self.hotKeyScrollView.frame.size.width, self.hotKeyScrollView.padding / 2);
    self.hotKeyScrollView.delegate = self;
    
    [self.floatMenuView addSubview:self.hotKeyScrollView];
    [self.floatMenuView addSubview:self.hotKeyScrollView.pageControl];
    [self.hotKeyScrollView.pageControl addTarget:self action:@selector(pageControlValueChange:) forControlEvents:UIControlEventValueChanged];
    self.floatMenuView.backgroundColor = [UIColor colorWithRed:0.5 green:0.2 blue:0.3 alpha:0.8];
    [self.view addSubview:self.floatMenuView];
    
    UIButton *button;
    for (int i=1; i<=15; ++i) {
        button = [[UIButton alloc] init];
        button.tag = i;
        [button setTitle:[NSString stringWithFormat:@"%d", i] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor blueColor]];
        [button addTarget:self action:@selector(hotKeyPress:) forControlEvents:UIControlEventTouchUpInside];
        [self.hotKeyScrollView addButton:button];
    }
}

- (void)hotKeyPress:(UIButton *)sender
{
    NSLog(@"click: %d", sender.tag);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.hotKeyScrollView) {
        self.hotKeyScrollView.pageControl.currentPage = (int)(self.hotKeyScrollView.contentOffset.x / self.hotKeyScrollView.frame.size.width);
    }
}

- (void)pageControlValueChange:(UIPageControl *)pageControl
{
    [self.hotKeyScrollView scrollRectToVisible:CGRectMake(self.hotKeyScrollView.frame.size.width*pageControl.currentPage, 0, self.hotKeyScrollView.frame.size.width, self.hotKeyScrollView.frame.size.height) animated:YES];
}


@end
