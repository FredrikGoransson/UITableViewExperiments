//
//  InvoiceTableViewCell.m
//  ExpandingTableViews
//
//  Created by Fredrik Göransson on 06/10/14.
//  Copyright (c) 2014 Forefront. All rights reserved.
//

#import "InvoiceTableViewCell.h"

@interface InvoiceTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *labelInvoiceNumber;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;
@property (weak, nonatomic) IBOutlet UILabel *labelAmount;

@end


@implementation InvoiceTableViewCell
-(instancetype)init
{
    self = [super init];
    if(self)
    {
        
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
