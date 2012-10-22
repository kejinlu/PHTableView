//
//  ViewController.m
//  PHTableView
//
//  Created by Luke on 10/22/12.
//  Copyright (c) 2012 Lu Ke. All rights reserved.
//

#import "ViewController.h"
#import "PHTableView.h"
#import "PHAvatarView.h"

@implementation ViewController

- (void)loadView{
    [super loadView];
    UIView *fixedHeaderView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 160)] autorelease];
    PHAvatarView *fixedView = [[PHAvatarView alloc] initWithAvatar:[UIImage imageNamed:@"luke.png"]];
    fixedView.frame = CGRectMake(40, 100, fixedView.frame.size.width, fixedView.frame.size.height);
    fixedView.backgroundColor = [UIColor clearColor];
    [fixedHeaderView addSubview:fixedView];
    fixedHeaderView.backgroundColor = [UIColor clearColor];
    
    UIImageView *stretchableHeaderView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cover.png"]];
    
    PHTableView *homeTableView = [[[PHTableView alloc] initWithFixedHeaderView:fixedHeaderView stretchableHeaderView:stretchableHeaderView] autorelease];
    homeTableView.frame = self.view.bounds;
    homeTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    homeTableView.delegate = self;
    homeTableView.dataSource = self;
    [self.view addSubview:homeTableView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UITableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 400.0;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UITableView Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UIView *bkgView = [[[UIView alloc] init] autorelease];
        bkgView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"feed-paper-texture.png"]];
        cell.backgroundView = bkgView;
    }
    return cell;
}

@end
