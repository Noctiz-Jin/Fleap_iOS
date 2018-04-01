//
//  NOCTableView.m
//  Fleap
//
//  Created by Yuning Jin on 3/25/18.
//  Copyright © 2018 Noctiz. All rights reserved.
//

#import "NOCTableView.h"

@interface NOCTableView ()

@property (strong, nonatomic) NSMutableArray *reusePool;

@end

@implementation NOCTableView

- (UITableViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier
{
    UITableViewCell* poolCell = nil;
    
    for (UITableViewCell* tableViewCell in [self reusePool])
    {
        if ([[tableViewCell reuseIdentifier] isEqualToString: identifier])
        {
            poolCell = tableViewCell;
            break;
        }
    }
    
    if (poolCell)
    {
        [[self reusePool] removeObject: poolCell];
    }
    
    return poolCell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
