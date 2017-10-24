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
        CGFloat toValue = 0;
        if (_direction == GCMarqueeDirectionLeftToRight || _direction == GCMarqueeDirectionRightToLeft) {
            caBasePosition.keyPath = @"transform.translation.x";
            if (_direction == GCMarqueeDirectionRightToLeft) {
                toValue = - (self.titleLable.frame.size.width + self.margin);
            }else{
                toValue = self.titleLable.frame.size.width + self.margin;
            }
        }else if (_direction == GCMarqueeDirectionBottomToTop || _direction == GCMarqueeDirectionTopToBottom){
            caBasePosition.keyPath = @"transform.translation.y";
            if (_direction == GCMarqueeDirectionBottomToTop) {
                toValue = - (self.subTitleLabel.frame.size.height);
            }else{
                toValue = self.subTitleLabel.frame.size.height;
            }
        }
        CGFloat fromValue = 0;
        caBasePosition.fromValue = [NSNumber numberWithFloat:fromValue];

        caBasePosition.toValue = [NSNumber numberWithFloat:toValue];
        caBasePosition.repeatCount = CGFLOAT_MAX;
        CGFloat durantion = (fabs(fromValue) + fabs(toValue)) * 0.1;
        caBasePosition.duration = durantion;
        [self.titleLable.layer addAnimation:caBasePosition forKey:@"paoma"];
        [self.subTitleLabel.layer addAnimation:caBasePosition forKey:@"paoma"];

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
    if (_direction == GCMarqueeDirectionRightToLeft || _direction == GCMarqueeDirectionLeftToRight) {
        _titleLable.numberOfLines = 1;
    }else{
        _titleLable.lineBreakMode = NSLineBreakByWordWrapping;
        _titleLable.numberOfLines = 0;
    }
    self.titleLable.preferredMaxLayoutWidth = self.frame.size.width;
    if(!self.subTitleLabel){
        UILabel *label2 = [[UILabel alloc] init];
        label2.textColor = _titleLable.textColor;
        label2.font = _titleLable.font;
        label2.numberOfLines = _titleLable.numberOfLines;
        label2.lineBreakMode = _titleLable.lineBreakMode;
        [self addSubview:label2];
        label2.text = _titleLable.text;
        [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(self.titleLable);
            if (_direction == GCMarqueeDirectionRightToLeft) {
                make.top.equalTo(self.titleLable);
                make.left.equalTo(self.titleLable.mas_right).offset(self.margin);
            }else if (_direction == GCMarqueeDirectionLeftToRight){
                make.top.equalTo(self.titleLable);
                make.right.equalTo(self.titleLable.mas_left).offset(-self.margin);
            } else if (_direction == GCMarqueeDirectionBottomToTop){
                make.top.equalTo(self.titleLable.mas_bottom);
                make.left.equalTo(self.titleLable);
            }else if (_direction == GCMarqueeDirectionTopToBottom){
                make.bottom.equalTo(self.titleLable.mas_top);
                make.left.equalTo(self.titleLable);
            }

        }];
        self.subTitleLabel = label2;
    }

}

@end
