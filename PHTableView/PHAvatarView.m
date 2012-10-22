//
//  PHAvatarView.m
//  pathHome
//
//  Created by Luke on 10/22/12.
//  Copyright (c) 2012 Lu Ke. All rights reserved.
//

#import "PHAvatarView.h"
#import <QuartzCore/QuartzCore.h>

@implementation PHAvatarView

- (id)initWithAvatar:(UIImage *)avatarImage{
    if (self = [super initWithFrame:CGRectMake(0, 0, 50, 50)]) {
        UIImageView *avatarImageView = [[[UIImageView alloc] initWithImage:avatarImage] autorelease];
        [avatarImageView sizeToFit];
        avatarImageView.layer.cornerRadius = avatarImage.size.width/2.0;
        avatarImageView.clipsToBounds = YES;
        avatarImageView.frame = CGRectMake(2, 0, avatarImageView.frame.size.width, avatarImageView.frame.size.height);
        [self addSubview:avatarImageView];
        
        UIImageView *maskView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"invites-user-avatar-edge.png"]] autorelease];
        [maskView sizeToFit];
        [self addSubview:maskView];
    }
    return self;
}

@end
