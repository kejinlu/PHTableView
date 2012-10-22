//
//  PHTableView.m
//  pathHome
//
//  Created by Luke on 10/22/12.
//  Copyright (c) 2012 Lu Ke. All rights reserved.
//

#import "PHTableView.h"

@implementation PHTableView
@synthesize stretchableHeaderView = _stretchableHeaderView;

- (void)dealloc{
    [_fixedHeaderView release];
    [_stretchableHeaderView release];
    
    [super dealloc];
}

- (id)initWithFixedHeaderView:(UIView *)fixedHeaderView stretchableHeaderView:(UIView *)stretchableHeaderView{
    if (self = [super init]) {
        _fixedHeaderView = [fixedHeaderView retain];
        _stretchableHeaderView = [stretchableHeaderView retain];
        
        UIView *headerView = [[[UIView alloc] initWithFrame:[fixedHeaderView bounds]] autorelease];
        self.tableHeaderView = headerView;
        UIView *stretchableMaskView = [[UIView alloc] initWithFrame:stretchableHeaderView.bounds];
        CGRect stretchableMaskViewFrame = stretchableMaskView.frame;
        stretchableMaskViewFrame.origin.y = headerView.frame.size.height - stretchableMaskViewFrame.size.height;
        stretchableMaskView.frame = stretchableMaskViewFrame;
        stretchableMaskView.clipsToBounds = YES;
        [headerView addSubview:stretchableMaskView];
        
        CGRect stretchableHeaderViewFrame = stretchableHeaderView.frame;
        stretchableHeaderViewFrame.origin.y = (stretchableHeaderViewFrame.size.height - headerView.frame.size.height)/2;
        stretchableHeaderView.frame = stretchableHeaderViewFrame;
        [stretchableMaskView addSubview:stretchableHeaderView];
        
        CGRect fixedHeaderViewFrame = fixedHeaderView.frame;
        fixedHeaderViewFrame.origin.x = 0;
        fixedHeaderViewFrame.origin.y = 0;
        fixedHeaderView.frame = fixedHeaderViewFrame;
        [headerView addSubview:fixedHeaderView];
    }
    return self;
}


- (void)setContentOffset:(CGPoint)contentOffset{
    if (contentOffset.y <=0 && contentOffset.y >= -1) {
        contentOffset.y = 0;
    }
    
    [super setContentOffset:contentOffset];
    
    CGFloat offsetY = contentOffset.y;
    
    if (offsetY <= 0) {
        CGFloat newOriginY = (_stretchableHeaderView.frame.size.height - (self.tableHeaderView.frame.size.height - offsetY ))/2 ;
        CGRect stretchableHeaderViewFrame = _stretchableHeaderView.frame;
        stretchableHeaderViewFrame.origin.y = newOriginY;
        _stretchableHeaderView.frame = stretchableHeaderViewFrame;
    }
}

@end
