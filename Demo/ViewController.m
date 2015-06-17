//
//  ViewController.m
//  Demo
//
//  Created by Kyon on 15/6/17.
//  Copyright (c) 2015年 Kyon Li. All rights reserved.
//

#import "ViewController.h"
#import "ADScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	NSMutableArray *imageNames = [[NSMutableArray alloc] init];
	for (NSInteger i = 1; i <= 7; i++) {
		[imageNames addObject:[NSString stringWithFormat:@"%ld.jpeg", i]];
	}
	ADScrollView *adScrollView = [[ADScrollView alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width-40, self.view.frame.size.height-200) andImageNames:imageNames];
	[[self view] addSubview:adScrollView];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
