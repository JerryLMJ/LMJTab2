//
//  LMJTab2.h
//  LMJTab2Demo
//
//  Created by Major on 2016/10/19.
//  Copyright © 2016年 iOS开发者工会. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LMJTab2;

@protocol LMJTab2Delegate <NSObject>

- (void)tab:(LMJTab2 *)tabControl didSelectedItemIndex:(NSInteger)index;

@end

@interface LMJTab2 : UIView

@property (nonatomic,assign) id<LMJTab2Delegate>delegate;


- (id)initWithFrame:(CGRect)frame edgeSpace:(CGFloat)space titleNormalColor:(UIColor *)titleNormalColor titleSelectedColor:(UIColor *)titleSelectedColor titleFont:(UIFont *)font lineWidth:(CGFloat)lineWidth lineHeight:(CGFloat)lineHeight lineColor:(UIColor *)lineColor;

- (void)setItems:(NSArray *)items andDefineIndex:(NSInteger)defineIndex;

@end
