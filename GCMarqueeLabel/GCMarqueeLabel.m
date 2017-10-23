//
//  GCMarqueeLabel.m
//  GCMarqueeLabel
//
//  Created by Gordon Su on 2017/10/23.
//  Copyright © 2017年 gordon. All rights reserved.
//

#import "GCMarqueeLabel.h"
#import <Masonry/Masonry.h>

@interface GCMarqueeLabel()
{
    BOOL _isAnimation;
}

@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UILabel *subTitleLabel;

@end

@implementation GCMarqueeLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titleLable];
        [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        self.clipsToBounds = YES;
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.titleLable];
        [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self layoutIfNeeded];
    [self startPaomaAnimation];
}

- (void)startPaomaAnimation
{
    if (!_isAnimation) {
        _isAnimation = YES;
        CABasicAnimation* caBasePosition = [CABasicAnimation animation];
        caBasePosition.keyPath = @"transform.translation.x";
        CGFloat fromValue = 0;
        caBasePosition.fromValue = [NSNumber numberWithFloat:fromValue];
        CGFloat toValue = - (self.subTitleLabel.frame.origin.x);
        caBasePosition.toValue = [NSNumber numberWithFloat:toValue];
        caBasePosition.repeatCount = CGFLOAT_MAX;
        CGFloat durantion = (fabs(fromValue) + fabs(toValue)) * 0.1;
        caBasePosition.duration = durantion;

        CABasicAnimation* caBasePosition2 = [CABasicAnimation animation];
        caBasePosition2.keyPath = @"transform.translation.x";
        CGFloat fromValue2 = 0;
        caBasePosition2.fromValue = [NSNumber numberWithFloat:fromValue2];
        CGFloat toValue2 = -(self.subTitleLabel.frame.origin.x);
        caBasePosition2.toValue = [NSNumber numberWithFloat:toValue2];
        caBasePosition2.repeatCount = CGFLOAT_MAX;
        caBasePosition2.duration = durantion;
        [self.titleLable.layer addAnimation:caBasePosition forKey:@"paoma1"];
        [self.subTitleLabel.layer addAnimation:caBasePosition2 forKey:@"paoma2"];
    }
}

- (UILabel *)titleLable
{
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.textColor = [UIColor blackColor];
    }
    return _titleLable;
}

- (void)setTitle:(NSString *)title
{
    self.titleLable.text = title;
    if(!self.subTitleLabel){
        UILabel *label2 = [[UILabel alloc] init];
        label2.textColor = _titleLable.textColor;
        label2.font = _titleLable.font;
        [self addSubview:label2];
        label2.text = _titleLable.text;
        [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(self.titleLable);
            make.top.equalTo(self.titleLable);
            make.left.equalTo(self.titleLable.mas_right).offset(10);
        }];
        self.subTitleLabel = label2;
    }

}

@end
