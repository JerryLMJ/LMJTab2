//
//  LMJTab2.m
//  LMJTab2Demo
//
//  Created by Major on 2016/10/19.
//  Copyright © 2016年 iOS开发者工会. All rights reserved.
//

#import "LMJTab2.h"

@implementation LMJTab2
{
    UIColor * _titleSelectedColor;
    UIColor * _titleNormalColor;
    UIFont  * _font;
    
    NSInteger        _itemsCount;
    NSMutableArray * _itemsArr;
    
    UIView * _line;
    
    CGFloat _edgeSpace;
}

- (id)init{
    NSAssert(NO, @"禁止使用init函数进行初始化，请使用initWithFrame:edgeSpace:titleNormalColor:titleSelectedColor:titleFont:lineWidth:lineHeight:lineColor:函数进行控件的初始化!");
    return nil;
}

- (id)initWithFrame:(CGRect)frame
{
    NSAssert(NO, @"禁止使用initWithFrame:函数进行初始化，请使用initWithFrame:edgeSpace:titleNormalColor:titleSelectedColor:titleFont:lineWidth:lineHeight:lineColor:函数进行控件的初始化!");
    return nil;
}

- (id)initWithFrame:(CGRect)frame edgeSpace:(CGFloat)space titleNormalColor:(UIColor *)titleNormalColor titleSelectedColor:(UIColor *)titleSelectedColor titleFont:(UIFont *)font lineWidth:(CGFloat)lineWidth lineHeight:(CGFloat)lineHeight lineColor:(UIColor *)lineColor{
    
    self = [super initWithFrame:frame];
    if (self) {
        _edgeSpace  = space;
        _itemsCount = 0;
        
        _itemsArr   = [NSMutableArray array];
        
        _titleSelectedColor = titleSelectedColor;
        _titleNormalColor   = titleNormalColor;
        _font               = font;
        
        _line = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height -lineHeight, lineWidth, lineHeight)];
        _line.backgroundColor = lineColor;
        [self addSubview:_line];
    }
    
    return self;
}

- (void)setItems:(NSArray *)items andDefineIndex:(NSInteger)defineIndex{

    _itemsCount = items.count;
    CGFloat itemWidth = (self.frame.size.width-_edgeSpace *2)/_itemsCount;
    
    [_itemsArr makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    for (int i = 0; i < _itemsCount; i++) {
        UIButton * itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [itemBtn setFrame:CGRectMake(_edgeSpace +itemWidth *i, 0, itemWidth, self.frame.size.height)];
        [itemBtn setBackgroundColor:[UIColor clearColor]];
        [itemBtn setTitle:items[i] forState:UIControlStateNormal];
        [itemBtn setHighlighted:NO];
        itemBtn.titleLabel.font = _font;
        [itemBtn setTag:(1000 +i)];
        [itemBtn addTarget:self action:@selector(clickItemBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:itemBtn];
        
        if (i == defineIndex) {
            [itemBtn setTitleColor:_titleSelectedColor forState:UIControlStateNormal];
        }else{
            [itemBtn setTitleColor:_titleNormalColor forState:UIControlStateNormal];
        }
        [_itemsArr addObject:itemBtn];
    }
    
    [_line setCenter:CGPointMake(_edgeSpace + itemWidth *defineIndex +itemWidth/2, _line.center.y)];
    [self bringSubviewToFront:_line];
}

- (void)clickItemBtn:(UIButton *)button{
    
    for (UIButton * itemBtn in _itemsArr) {
        if (itemBtn.tag == button.tag) {
            [itemBtn setTitleColor:_titleSelectedColor forState:UIControlStateNormal];
        }else{
            [itemBtn setTitleColor:_titleNormalColor forState:UIControlStateNormal];
        }
    }
    
    int itemWidth = (self.frame.size.width -_edgeSpace*2)/_itemsCount;
    
    [UIView animateWithDuration:0.2 animations:^{
        [_line setCenter:CGPointMake(_edgeSpace + itemWidth *(button.tag - 1000) +itemWidth/2, _line.center.y)];
    } completion:^(BOOL finished) {
        
    }];
    
    if ([self.delegate respondsToSelector:@selector(tab:didSelectedItemIndex:)]) {
        [self.delegate tab:self didSelectedItemIndex:button.tag -1000];
    }
}

@end
