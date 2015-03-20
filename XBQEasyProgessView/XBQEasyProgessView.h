//
//  XBQEasyProgessView.h
//  XBQEasyProgessView
//
//  Created by new on 15/3/19.
//  Copyright (c) 2015年 com.BeeBubble. All rights reserved.
//

#import <UIKit/UIKit.h>


IB_DESIGNABLE
@interface XBQEasyProgessView : UIView
{
}
@property(nonatomic)IBInspectable int maxCount;
@property(nonatomic)IBInspectable int curCount;
@property(nonatomic)IBInspectable UIColor *backgroundColor;
@property(nonatomic)IBInspectable UIColor *lineColor;
@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic)  CALayer *lineLayer;

@end