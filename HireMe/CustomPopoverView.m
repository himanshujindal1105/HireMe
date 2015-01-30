//
//  HMPopoverView.m
//  HireMe
//
//  Created by Seema on 1/22/15.
//  Copyright (c) 2015 HireMe. All rights reserved.
//

#import "CustomPopoverView.h"

const CGSize PopoverDefaultSize = (CGSize){ 248.0f, 40.0f };

const CGFloat PopoverDefaultCornerRadius = 4.0f;

const CGFloat PopoverPadding = 8.0f;

const CGPoint PopoverDefaultBackgroundOffset = (CGPoint){ -1.0f, -1.0f };

@interface CustomPopoverView()
@property (nonatomic, strong) HMPopoverContainerView *popoverContainerView;

@end

@implementation CustomPopoverView

+(instancetype)popover {
    return [self popoverWithTitle:nil];
}

+(instancetype)popoverWithFrame:(CGRect)frame{
    return [[self alloc] popoverWithFrame:frame];
}

+(instancetype)popoverWithTitle:(NSString *)title{
    return [[self alloc] initWithTitle:title];
}

-(id)initWithTitle:(NSString *)title{
    self = [self initWithFrame:(CGRect){CGPointZero, PopoverDefaultSize }];
    if (nil != self) {
        [self.titleLabel setText:title];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (nil != self) {
        [self setup];
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    if (nil != self) {
        [self setup];
    }
    return self;
}

//-(void)setTitle:(NSString *)title {
//    self.titleLabel.text = title;
//}
//
//-(NSString *)title {
//    return self.titleLabel.text;
//}
//
//-(void)setTitleColor:(UIColor *)color {
//    self.titleLabel.textColor = color;
//}
//
//-(void)setTitleFontSize:(CGFloat)size{
//    self.titleLabel.font = [UIFont customSemiBoldFontWithSize:size];
//}
//
//-(UIColor *)titleColor {
//
//    return self.titleLabel.textColor;
//}

-(void)setup {

    _popoverContainerView = [[HMPopoverContainerView alloc] init];
    _popoverContainerView.backgroundColor = [UIColor clearColor];
    _popoverContainerView.userInteractionEnabled = NO;
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.font = CustomPopoverDefaultFont;
    _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _titleLabel.numberOfLines = 0;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor whiteColor];
    
    _popoverCornerRadius = PopoverDefaultCornerRadius;
    self.backgroundColor = [UIColor clearColor];
    self.clipsToBounds = NO;
    
    [self insertSubview:_titleLabel atIndex:0];
    [self insertSubview:_popoverContainerView atIndex:0];

}

#pragma mark - View lifecyle

-(void) layoutSubviews {
    [super layoutSubviews];
    [self.popoverContainerView setNeedsLayout];
    [self.titleLabel setFrame:self.bounds];
}

-(void) setNeedsLayout {
    [super setNeedsDisplay];
    [self.popoverContainerView setNeedsDisplay];
}

-(void) setPopoverColor:(UIColor *)popoverColor {
    _popoverColor = popoverColor;
    [self setNeedsDisplay];
}

-(void)setTitle:(NSString *)title{
    self.titleLabel.text = title;
}

-(NSString *)title{
    return self.titleLabel.text;
}

-(void) setTitleColor:(UIColor *)color{
    self.titleLabel.textColor = color;
}

-(void) setTitleFontSize:(CGFloat)size{
    self.titleLabel.font = [UIFont customSemiBoldFontWithSize:size];
}

-(UIColor *)titleColor {
    return self.titleLabel.textColor;
}

@end

@interface HMPopoverContainerView()

@property (nonatomic, strong) CAShapeLayer *maskLayer;
@end

@implementation HMPopoverContainerView

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (nil != self ) {
        self.layer.mask = self.maskLayer;
    }
    return self;
}

-(void)drawRect:(CGRect)rect {

    CustomPopoverView *popover = (CustomPopoverView *)self.superview;
    
    // prepare the context to draw into
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // fill with popover color
    CGContextSetFillColorWithColor(context, [popover.popoverColor CGColor]);
    
    if (nil != popover.backgroundImage) {
        // fill with white to blend background image
        CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
        
        CGContextFillRect(context, rect);
        
        // draw the background image
        CGPoint offset = popover.backgroundOffset;
        if (CGPointEqualToPoint(offset, PopoverDefaultBackgroundOffset)) {
            offset = (CGPoint){
                CGRectGetMidX(rect) - popover.backgroundImage.size.width / 2,
                CGRectGetMidY(rect) - popover.backgroundImage.size.height / 2 };
        }
        [popover.backgroundImage drawAtPoint:offset blendMode:kCGBlendModeLuminosity alpha:1.0f];
        
        // set the blend mode for popover color
        CGContextSetBlendMode(context, kCGBlendModeMultiply);
    }
    
    // fill with popover color
    CGContextSetFillColorWithColor(context, [popover.popoverColor CGColor]);
    CGContextFillRect(context, rect);
    
}
-(void) layoutSubviews{

    [super layoutSubviews];
    
//    CustomPopoverView  *popover = (CustomPopoverView *) self.superview;

    self.maskLayer.frame = self.bounds;
}

- (CAShapeLayer *)maskLayer {
    if (nil == _maskLayer) {
        _maskLayer = [CAShapeLayer layer];
    }
    return _maskLayer;
}

@end
