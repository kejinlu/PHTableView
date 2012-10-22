//
//  PHTableView.h
//  pathHome
//
//  Created by Luke on 10/22/12.
//  Copyright (c) 2012 Lu Ke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PHTableView : UITableView{
    UIView *_fixedHeaderView;
    UIView *_stretchableHeaderView;
}

@property (nonatomic, retain) UIView *stretchableHeaderView;

- (id)initWithFixedHeaderView:(UIView *)fixedHeaderView stretchableHeaderView:(UIView *)stretchableHeaderView;

@end
