//
//  YYFloatView.m
//  YYFloatMenuView
//
//  Created by Yuan-Yi Chang on 2014/7/14.
//  Copyright (c) 2014年 Yuan-Yi Chang. All rights reserved.
//

#import "YYFloatView.h"

@implementation YYFloatView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.locked = YES;
    if (!self.dragEnable)
        return;
    self.beginPoint = [[touches anyObject] locationInView:self];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.locked = NO;
    if (!self.dragEnable)
        return;
    CGPoint nowPoint = [[touches anyObject] locationInView:self];
    float offsetX = nowPoint.x - self.beginPoint.x;
    float offsetY = nowPoint.y - self.beginPoint.y;
    self.center = CGPointMake(self.center.x + offsetX, self.center.y + offsetY);
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.locked)
        self.locked = NO;
    
    if (self.superview && self.adsorbEnable) {
        self.maxWidth = UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation) ? self.superview.frame.size.height : self.superview.frame.size.width;
        self.maxHeight = UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation) ? self.superview.frame.size.width : self.superview.frame.size.height;
        
        float marginLeft = self.frame.origin.x;
        float marginRight = self.maxWidth - self.frame.origin.x - self.frame.size.width;
        float marginTop = self.frame.origin.y;
        float marginBottom = self.maxHeight - self.frame.origin.y - self.frame.size.height;

        [UIView animateWithDuration:0.2 animations:^(void){
            if (marginTop<60) {
                self.frame = CGRectMake(marginLeft<marginRight?marginLeft<self.padding?self.padding:self.frame.origin.x:marginRight<self.padding?self.maxWidth -self.frame.size.width-self.padding:self.frame.origin.x,
                                        self.padding,
                                        self.frame.size.width,
                                        self.frame.size.height);
            }
            else if (marginBottom<60) {
                self.frame = CGRectMake(marginLeft<marginRight?marginLeft<self.padding?self.padding:self.frame.origin.x:marginRight<self.padding?self.maxWidth -self.frame.size.width-self.padding:self.frame.origin.x,
                                        self.maxHeight - self.frame.size.height-self.padding,
                                        self.frame.size.width,
                                        self.frame.size.height);
                
            }
            else {
                self.frame = CGRectMake(marginLeft<marginRight?self.padding:self.maxWidth - self.frame.size.width-self.padding,
                                        self.frame.origin.y,
                                        self.frame.size.width,
                                        self.frame.size.height);
            }
        }];
    }
}

@end
