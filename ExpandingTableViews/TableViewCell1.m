//
//  TableViewCell1.m
//  ExpandingTableViews
//
//  Created by Fredrik Göransson on 06/10/14.
//  Copyright (c) 2014 Forefront. All rights reserved.
//

#import "TableViewCell1.h"

@implementation TableViewCell1

- (instancetype)init
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TableViewCell1"];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"TableViewCell1" owner:self options:nil] firstObject];

    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
