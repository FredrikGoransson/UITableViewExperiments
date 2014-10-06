//
//  InvoiceHeaderTableViewCell.m
//  ExpandingTableViews
//
//  Created by Fredrik Göransson on 06/10/14.
//  Copyright (c) 2014 Forefront. All rights reserved.
//

#import "InvoiceHeaderTableViewCell.h"
#import "ExpandableTableViewCellDataSource"

@implementation InvoiceHeaderTableViewCell <ExpandableTableViewCellDataSource>

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
