//
//  ViewController.m
//  GCMarqueeLabel.git GCMarqueeLabel
//
//  Created by Gordon Su on 2017/10/23.
//  Copyright © 2017年 gordon. All rights reserved.
//

#import "ViewController.h"
#import "GCMarqueeLabel.h"
#import <Masonry/Masonry.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    GCMarqueeLabel *label = [[GCMarqueeLabel alloc] init];
    [label setTitle:@"1234567890"];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 44));
        make.center.equalTo(self.view);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
