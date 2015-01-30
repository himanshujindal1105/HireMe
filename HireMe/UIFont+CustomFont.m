//
//  UIFont+CustomFont.m
//  HireMe
//
//  Created by Seema on 1/23/15.
//  Copyright (c) 2015 HireMe. All rights reserved.
//

#import "UIFont+CustomFont.h"

@implementation UIFont (CustomFont)

+ (UIFont *) customSemiBoldFontWithSize:(CGFloat)size{
    return [UIFont fontWithName:@"OPENSANS-SEMIBOLD" size:size];
}

+ (UIFont *) customMediumFontWithSize:(CGFloat)size{
    return [UIFont fontWithName:@"OPENSANS-REGULAR" size:size];
}

+ (UIFont *) customSmallFontWithSize:(CGFloat)size{
    return [UIFont fontWithName:@"OPENSANS-REGULAR" size:size];
}

@end
