//
//  ViewController.m
//  LMJTab2Demo
//
//  Created by Major on 2016/10/19.
//  Copyright © 2016年 iOS开发者工会. All rights reserved.
//

#import "ViewController.h"

#import "LMJTab2.h"


@interface ViewController () <LMJTab2Delegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LMJTab2 * tab = [[LMJTab2 alloc] initWithFrame:CGRectMake(10, 100, 300, 40) edgeSpace:50 titleNormalColor:[UIColor grayColor] titleSelectedColor:[UIColor blackColor] titleFont:[UIFont systemFontOfSize:12] lineWidth:30 lineHeight:3 lineColor:[UIColor greenColor]];
    tab.backgroundColor = [UIColor lightGrayColor];
    tab.delegate        = self;
    [tab setItems:@[@"选项一",@"选项二",@"选项三",@"选项四"] andDefineIndex:0];
    [self.view addSubview:tab];
}


- (void)tab:(LMJTab2 *)tabControl didSelectedItemIndex:(NSInteger)index{
    if (index == 0) {
        NSLog(@"点击了“选项一”");
    }else if (index == 1) {
        NSLog(@"点击了“选项二”");
    }else if (index == 2) {
        NSLog(@"点击了“选项三”");
    }else if (index == 3){
        NSLog(@"点击了“选项四”");
    }
}

@end
