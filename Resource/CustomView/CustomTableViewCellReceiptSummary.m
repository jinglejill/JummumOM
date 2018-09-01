//
//  CustomTableViewCellReceiptSummary.m
//  Jummum
//
//  Created by Thidaporn Kijkamjai on 11/3/2561 BE.
//  Copyright © 2561 Appxelent. All rights reserved.
//

#import "CustomTableViewCellReceiptSummary.h"

@implementation CustomTableViewCellReceiptSummary

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.indicator.alpha = 0;
    [self.indicator stopAnimating];
    self.indicator.hidden = YES;
    self.btnOrderItAgain.enabled = YES;
}
@end
