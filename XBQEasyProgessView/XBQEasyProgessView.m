//
//  XBQEasyProgessView.m
//  XBQEasyProgessView
//
//  Created by Xiaobangqaing on 15/3/19.
//  Copyright (c) 2015年 com.BeeBubble. All rights reserved.
//
IB_DESIGNABLE
#import "XBQEasyProgessView.h"

@implementation XBQEasyProgessView
//#pragma mark - Inspectable properties
- (void)setMaxCount:(int)maxCount {
    _maxCount = maxCount;
    if (self.lineLayer) {
        [self setupView];
    }
}

- (void)setCurCount:(int)curCount {
    _curCount = curCount;
    if (self.lineLayer) {
        [self setupView];
    }
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    [self setupView];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    _backgroundColor = backgroundColor;
    [self setupView];
}

- (void)setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
    if (self.lineLayer) {
        [self setupView];
    }
}

- (void)layoutSubviews {
    // resize your layers based on the view's new bounds
    _lineLayer.frame = self.bounds;
    [self setupView];
}

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    _lineLayer = [CALayer layer];
    _lineLayer.frame = self.layer.frame;
    [self.layer addSublayer:_lineLayer];
    [self setupView];
}

#pragma mark - Overrides
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupDefaultValues];
        [self setupView];
    }
    return self;
}

#pragma mark - Initializer
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _lineLayer = [CALayer layer];
        _lineLayer.frame = self.layer.frame;
        
        [self.layer addSublayer:_lineLayer];
        
        [self setupDefaultValues];
        [self setupView];
    }
    return self;
}

#pragma mark - Internal functions
- (void)setupDefaultValues {
    self.backgroundColor = [UIColor whiteColor];
    self.lineColor = [UIColor redColor];
    self.cornerRadius = 2;
    self.maxCount = 100;
    self.curCount = 50;
}

- (void)setupView {
    if (self.lineLayer && self.maxCount != 0 && self.curCount != 0) {
        _lineLayer.backgroundColor = self.lineColor.CGColor;
        float a = self.curCount / (float)self.maxCount;
        _lineLayer.frame = CGRectMake(0, 0, self.layer.frame.size.width * a, self.layer.frame.size.height);
        _lineLayer.cornerRadius = _cornerRadius;
    }
    self.layer.backgroundColor = self.backgroundColor.CGColor;
    self.layer.cornerRadius = self.cornerRadius;
    [self setNeedsDisplay];
}

@end
