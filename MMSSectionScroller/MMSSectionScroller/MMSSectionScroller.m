//
//  MMSSectionScroller.m
//  MMSSectionScroller
//
//  Created by Michal Smialko on 12/8/13.
//  Copyright (c) 2013 Michal Smialko. All rights reserved.
//

#import "MMSSectionScroller.h"

@implementation MMSSectionScroller

#pragma mark - Setters

- (void)setContentView:(UIView *)contentView
{
    _contentView = contentView;
    contentView.frame = self.bounds;
    [self addSubview:contentView];
}

#pragma mark - MMSSectionScroller

- (instancetype)initWithFrame:(CGRect)frame scrollView:(UIScrollView *)scrollView;
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        [scrollView addSubview:self];
        [scrollView addObserver:self
                     forKeyPath:NSStringFromSelector(@selector(contentOffset))
                        options:NSKeyValueObservingOptionNew
                        context:nil];
    }
    return self;
}

#pragma mark - NSObject <KVO>

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(contentOffset))]) {
        UIScrollView *scrollView = (UIScrollView *)object;
        CGPoint offset = ((UIScrollView *)object).contentOffset;
        
        CGFloat margin = 80;
        CGFloat progressPercent = (offset.y - self.frame.size.height/2.) / (scrollView.contentSize.height - scrollView.frame.size.height);
        
        self.frame = CGRectMake(self.frame.origin.x,
                                progressPercent * (scrollView.contentSize.height - 2*margin) + margin,
                                self.frame.size.width,
                                self.frame.size.height);
        

        NSInteger section = (NSInteger)(self.sectiounsCount * progressPercent);
        [self.delegate configureContentView:self.contentView forSection:section];
    }
}

@end
