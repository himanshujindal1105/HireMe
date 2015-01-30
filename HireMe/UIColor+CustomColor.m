//
//  UIColor+CustomColor.m
//  HireMe
//
//  Created by Seema on 1/27/15.
//  Copyright (c) 2015 HireMe. All rights reserved.
//

#import "UIColor+CustomColor.h"



@implementation UIColor (CustomColor)


static UIColor * customColorGreen = nil;
static UIColor * customColorBlue = nil;
static UIColor * customColorBlack = nil;
static UIColor * customColorWhite = nil;
static UIColor * customColorLinkdInBlue = nil;

+ (void) initializeCustomColor {
    customColorGreen = RGBCOLOR(92, 195, 18);
    customColorBlue = RGBCOLOR(47, 63, 219);
    customColorBlack  = RGBCOLOR(34, 34, 34);
    customColorWhite = RGBCOLOR(255, 255, 255);
    customColorLinkdInBlue = RGBCOLOR(0, 119, 181);
}

+ (UIColor *) customColorGreen {
    [UIColor initializeCustomColor];
    return customColorGreen;
}
+ (UIColor *) customColorBlue {
    [UIColor initializeCustomColor];
    return customColorBlue;
}
+ (UIColor *) customColorLinkdInBlue {
    [UIColor initializeCustomColor];
    return customColorLinkdInBlue;
}
+ (UIColor *) customColorBlack {
    [UIColor initializeCustomColor];
    return customColorBlack;
}
+ (UIColor *) customColorWhite {
    [UIColor initializeCustomColor];
    return customColorWhite;
}

@end
 