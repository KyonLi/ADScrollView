//
//  ADScrollView.h
//  HomeWork
//
//  Created by Kyon on 15/4/29.
//  Copyright (c) 2015年 Kyon Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADScrollView : UIView <UIScrollViewDelegate>

@property NSArray *imageViews;
@property NSInteger currentIndex;
@property NSArray *imageNames;
@property CGRect viewFrame;

- (instancetype)initWithFrame:(CGRect)frame andImageNames:(NSArray *)imageNames;

@end
