//
//  MMSViewController.m
//  MMSSectionScroller
//
//  Created by Michal Smialko on 12/8/13.
//  Copyright (c) 2013 Michal Smialko. All rights reserved.
//

#import "MMSViewController.h"
#import "MMSSectionScroller.h"

@interface MMSViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) MMSSectionScroller *sectionIndicator;
@property (nonatomic) NSInteger sectionsCount;

@end

@implementation MMSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.sectionsCount = 10;
    // Setting up scroll view
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width,
                                             2000);
    
    for (NSInteger i=0; i<self.sectionsCount; i++) {
        UILabel *sectionLabel = [[UILabel alloc] init];
        sectionLabel.text = [NSString stringWithFormat:@"Section %i", i+1];
        CGRect labelFrame;
        labelFrame = CGRectMake(20,
                                20 + i * self.scrollView.contentSize.height / self.sectionsCount,
                                100,
                                80);
        sectionLabel.frame = labelFrame;
        [self.scrollView addSubview:sectionLabel];
    }
    
    // Section scroller
    self.sectionIndicator = [[MMSSectionScroller alloc] initWithFrame:CGRectMake(0, 0, 70, 35)
                                                           scrollView:self.scrollView];
}

@end
