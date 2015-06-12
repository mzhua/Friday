//
//  DetailTableViewCell.m
//  Friday
//
//  Created by hua on 15/6/12.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "DetailTableViewCell.h"

@interface DetailTableViewCell ()



@end

@implementation DetailTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleLable];
        
        [self setFrames];
    }
    
    return self;
}

-(void)setFrames{
    _titleLable.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(UILabel *)titleLable{

    if(!_titleLable){
        _titleLable = [[UILabel alloc] init];
        _titleLable.textColor = [UIColor blackColor];
        
    }
    
    return _titleLable;
}

@end
