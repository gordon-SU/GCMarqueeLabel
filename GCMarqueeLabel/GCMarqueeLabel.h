//
//  GCMarqueeLabel.h
//  GCMarqueeLabel
//
//  Created by Gordon Su on 2017/10/23.
//  Copyright © 2017年 gordon. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,GCMarqueeDirection) {
    GCMarqueeDirectionRightToLeft = 0,
    GCMarqueeDirectionLeftToRight,
    GCMarqueeDirectionTopToBottom,
    GCMarqueeDirectionBottomToTop
};

@interface GCMarqueeLabel : UIView

@property (nonatomic, strong, readonly) UILabel *titleLable;

@property (nonatomic) GCMarqueeDirection direction;

@property (nonatomic) CGFloat margin;

- (void)setTitle:(NSString *)title;

@end
