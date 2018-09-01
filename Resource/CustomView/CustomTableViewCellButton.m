//
//  CustomTableViewCellButton.m
//  Jummum2
//
//  Created by Thidaporn Kijkamjai on 11/5/2561 BE.
//  Copyright © 2561 Appxelent. All rights reserved.
//

#import "CustomTableViewCellButton.h"

@implementation CustomTableViewCellButton

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
    self.btnValue.enabled = YES;
}
@end
