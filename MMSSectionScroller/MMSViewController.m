//
//  MMSViewController.m
//  MMSSectionScroller
//
//  Created by Michal Smialko on 12/8/13.
//  Copyright (c) 2013 Michal Smialko. All rights reserved.
//

#import "MMSViewController.h"

@interface MMSViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
