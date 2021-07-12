//
//  UIButton+Highlighted.m
//  rs.ios.stage-task-7
//
//  Created by dev on 9.07.21.
//

#import "UIButton+Highlighted.h"

@implementation UIButton (Highlighted)

-(void)changeToHighlighted:(BOOL)check {
    if (check) {
        self.backgroundColor = [[UIColor colorNamed:@"Little Boy Blue"] colorWithAlphaComponent:0.2];
        self.titleLabel.alpha = 0.4;
    } else {
        self.backgroundColor = [UIColor whiteColor];
        self.titleLabel.alpha = 1;
    }
}

@end
