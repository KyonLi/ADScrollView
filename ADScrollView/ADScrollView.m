//
//  ADScrollView.m
//  HomeWork
//
//  Created by Kyon on 15/4/29.
//  Copyright (c) 2015年 Kyon Li. All rights reserved.
//

#import "ADScrollView.h"

@implementation ADScrollView

- (instancetype)initWithFrame:(CGRect)frame andImageNames:(NSArray *)imageNames {
    if (self = [super initWithFrame:frame]) {
        _currentIndex = 1;
        [self setImageNames:imageNames];
        [self setViewFrame:frame];
        
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [scrollView setDelegate:self];
        [scrollView setContentSize:CGSizeMake(frame.size.width*([imageNames count]+2), frame.size.height)];
        [scrollView setPagingEnabled:YES];
        [scrollView setShowsVerticalScrollIndicator:NO];
		[scrollView setShowsHorizontalScrollIndicator:NO];
        [scrollView setBounces:NO];
        [scrollView setContentOffset:CGPointMake((_currentIndex)*frame.size.width, 0)];
        
        UIImageView *imageView1 = [[UIImageView alloc] init];
        [scrollView addSubview:imageView1];
        UIImageView *imageView2 = [[UIImageView alloc] init];
        [scrollView addSubview:imageView2];
        UIImageView *imageView3 = [[UIImageView alloc] init];
        [scrollView addSubview:imageView3];
        [self setImageViews:@[imageView1, imageView2, imageView3]];
        
        [self addSubview:scrollView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((frame.size.width-60)/2, frame.size.height-60, 60, 20)];
        [label setTag:100];
        [label setBackgroundColor:[UIColor colorWithWhite:0.502 alpha:1.000]];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setAdjustsFontSizeToFitWidth:YES];
        [self addSubview:label];
		
        [self scrollViewDidEndDecelerating:scrollView];
    }
    return self;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    UILabel *label = (UILabel *)[self viewWithTag:100];
    _currentIndex = scrollView.contentOffset.x/_viewFrame.size.width;
    
    if (_currentIndex == 0) {
        _currentIndex = _imageNames.count;
        [scrollView setContentOffset:CGPointMake(_viewFrame.size.width*_currentIndex, 0)];
    }
    else if (_currentIndex == _imageNames.count+1) {
        _currentIndex = 1;
        [scrollView setContentOffset:CGPointMake(_viewFrame.size.width*_currentIndex, 0)];
    }

    NSArray *images = [self convertToPicArr:_imageNames andCenterImageNameIndex:_currentIndex-1];
    for (NSInteger i = 0; i < 3; i++) {
        [_imageViews[i] setImage:images[i]];
        [_imageViews[i] setFrame:CGRectMake((_currentIndex-1+i)*_viewFrame.size.width, 0, _viewFrame.size.width, _viewFrame.size.height)];
    }
    [label setText:[NSString stringWithFormat:@"%ld/%ld", _currentIndex, _imageNames.count]];
}

- (NSArray *)convertToPicArr:(NSArray *)imageNames andCenterImageNameIndex:(NSInteger)index {
	NSMutableArray *picArr = [NSMutableArray new];
	if (index == 0) {
		[picArr addObject:[UIImage imageNamed:[imageNames lastObject]]];
		[picArr addObject:[UIImage imageNamed:[imageNames objectAtIndex:index]]];
		[picArr addObject:[UIImage imageNamed:[imageNames objectAtIndex:index+1]]];
	}
	else if (index == [imageNames count]-1) {
		[picArr addObject:[UIImage imageNamed:[imageNames objectAtIndex:index-1]]];
		[picArr addObject:[UIImage imageNamed:[imageNames objectAtIndex:index]]];
		[picArr addObject:[UIImage imageNamed:[imageNames firstObject]]];
	}
	else {
		[picArr addObject:[UIImage imageNamed:[imageNames objectAtIndex:index-1]]];
		[picArr addObject:[UIImage imageNamed:[imageNames objectAtIndex:index]]];
		[picArr addObject:[UIImage imageNamed:[imageNames objectAtIndex:index+1]]];
	}
	return picArr;
}

@end
