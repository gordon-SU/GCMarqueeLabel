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
    label.direction = GCMarqueeDirectionLeftToRight;
    label.margin = 20;
    [label setTitle:@"left to right →"];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@44);
        make.top.equalTo(self.view).offset(64);
        make.centerX.equalTo(self.view);
    }];
    GCMarqueeLabel *label2 = [[GCMarqueeLabel alloc] init];
    label2.direction = GCMarqueeDirectionRightToLeft;
    label2.margin = 20;
    [label2 setTitle:@"right to left ←"];
    [self.view addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@44);
        make.top.equalTo(self.view).offset(64*2);
        make.centerX.equalTo(self.view);
    }];
    GCMarqueeLabel *label3 = [[GCMarqueeLabel alloc] init];
    label3.direction = GCMarqueeDirectionTopToBottom;
    [label3 setTitle:@"top to bottom ↓"];
    [self.view addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@60);
        make.top.equalTo(self.view).offset(64*3);
        make.centerX.equalTo(self.view);
    }];
    GCMarqueeLabel *label4 = [[GCMarqueeLabel alloc] init];
    label4.direction = GCMarqueeDirectionBottomToTop;
    [label4 setTitle:@"bottom to top ↑"];
    [self.view addSubview:label4];
    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@60);
        make.top.equalTo(label3.mas_bottom).offset(12);
        make.centerX.equalTo(self.view);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
