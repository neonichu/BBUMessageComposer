//
//  UIView+Geometry.m
//  Feed Me
//
//  Created by Boris Bügling on 08.06.13.
//  Copyright (c) 2013 Boris Bügling. All rights reserved.
//

#import "UIView+Geometry.h"

@implementation UIView (Geometry)

-(CGFloat)width {
    return self.frame.size.width;
}

-(CGFloat)height {
    return self.frame.size.height;
}

-(CGFloat)x {
    return self.frame.origin.x;
}

-(CGFloat)y {
    return self.frame.origin.y;
}

#pragma mark -

-(void)setWidth:(CGFloat)width {
    self.frame = CGRectMake(self.x, self.y, width, self.height);
}

-(void)setHeight:(CGFloat)height {
    self.frame = CGRectMake(self.x, self.y, self.width, height);
}

-(void)setX:(CGFloat)x {
    self.frame = CGRectMake(x, self.y, self.width, self.height);
}

-(void)setY:(CGFloat)y {
    self.frame = CGRectMake(self.x, y, self.width, self.height);
}


@end
