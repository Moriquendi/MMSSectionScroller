//
//  MMSSectionScroller.h
//  MMSSectionScroller
//
//  Created by Michal Smialko on 12/8/13.
//  Copyright (c) 2013 Michal Smialko. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MMSSectionScrollerDelegate <NSObject>
@optional
- (void)configureView:(UIView *)view forSection:(NSInteger)section;
@end

@interface MMSSectionScroller : UIView

// Designated initializer
- (instancetype)initWithFrame:(CGRect)frame scrollView:(UIScrollView *)scrollView;

- (instancetype)initWithFrame:(CGRect)frame __attribute__((unavailable("Use initWithFrame:scrollView instead.")));

@end
