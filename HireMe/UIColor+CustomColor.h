//
//  UIColor+CustomColor.h
//  HireMe
//
//  Created by Seema on 1/27/15.
//  Copyright (c) 2015 HireMe. All rights reserved.
//

#define RGBCOLOR(_R_,_G_,_B_) [UIColor colorWithRed:(CGFloat)(_R_)/255.0f green:(CGFloat)(_G_)/255.0f blue:(CGFloat)(_B_)/255.0f alpha:1.0f]

#define RGBACOLOR(_R_, _G_, _B_, _A_) [UIColor colorWithRed:(CGFloat)(_R_)/255.0f green:(CGFloat)(_G_)/255.0f blue:(CGFloat)(_B_)/255.0f alpha:(CGFloat)(_A_)/255.0f]

@interface UIColor (CustomColor)

+ (UIColor *) customColorGreen;
+ (UIColor *) customColorBlue;
+ (UIColor *) customColorLinkdInBlue;
+ (UIColor *) customColorBlack;
+ (UIColor *) customColorWhite;

@end
