//
//  MKAuthorizeButton.m
//  rs.ios.stage-task-7
//
//  Created by dev on 9.07.21.
//

#import "MKAuthorizeButton.h"

@implementation MKAuthorizeButton

-(void)awakeFromNib {
    [super awakeFromNib];
    self.layer.borderColor = [UIColor colorNamed:@"Little Boy Blue"].CGColor;
    self.layer.borderWidth = 2;
    self.layer.cornerRadius = 10;
    [self setImage:[UIImage imageNamed:@"personfill"] forState:UIControlStateHighlighted];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 5)];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
    self.clipsToBounds = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
