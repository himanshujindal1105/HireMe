//
//  HMPopoverView.h
//  HireMe
//
//  Created by Seema on 1/22/15.
//  Copyright (c) 2015 HireMe. All rights reserved.
//


#import "UIFont+CustomFont.h"

#define CustomPopoverDefaultFont [UIFont customSemiBoldFontWithSize:26.0f]

@interface CustomPopoverView : UIControl

@property(nonatomic, strong, readonly) UILabel *titleLabel;
@property(nonatomic, strong) UIColor *popoverColor;
@property(nonatomic) CGFloat popoverCornerRadius;
@property (nonatomic, strong) UIImage *backgroundImage;
@property (nonatomic, assign) CGPoint backgroundOffset;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) UIColor *titleColor;
@property(nonatomic) CGFloat titleFontSize;

+(instancetype)popover;
+(instancetype)popoverWithTitle:(NSString *)title;
//+(instancetype)popoverWithTitle:(NSString *)title style:(HMPopoverStyle)style;
+(instancetype)popoverWithFrame:(CGRect)frame;
-(id)initWithTitle:(NSString *)title;
@end

@interface HMPopoverContainerView : UIView

@end