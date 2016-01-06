//
//  ViewController.m
//  五边形进度条demo
//
//  Created by asun on 15/11/9.
//  Copyright © 2015年 yinyi. All rights reserved.
//

#import "ViewController.h"
#import "PentagonProgressView/PentagonProgressView.h"

@interface ViewController ()
@property (nonatomic,weak)PentagonProgressView *pentagonView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor yellowColor];
//    PentagonProgressView *pentagonView = [[PentagonProgressView alloc] initWithFrame:CGRectMake(100, 200, 100, 100) remainderColor:[UIColor redColor] completeColor:[UIColor brownColor] lineWidth:14];
    PentagonProgressView *pentagonView = [[PentagonProgressView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    pentagonView.completeColor = [UIColor redColor];
    self.pentagonView = pentagonView;
    pentagonView.progressBackgroundColor = [UIColor grayColor];
    pentagonView.lineWidth = 5;
//    pentagonView.progress = 66;
    
    [self.view addSubview:pentagonView];
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 350, 200, 30)];
    [slider addTarget:self action:@selector(progressChanged:) forControlEvents:UIControlEventValueChanged];
    slider.maximumValue = 100;
    slider.minimumValue = 0;
    [self.view addSubview:slider];
}

- (void)progressChanged:(UISlider *)slider {
    _pentagonView.progress = slider.value;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
