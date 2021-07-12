//
//  MKSecureButton.m
//  rs.ios.stage-task-7
//
//  Created by dev on 13.07.21.
//

#import "MKSecureButton.h"

@implementation MKSecureButton

-(void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = 25;
    self.layer.borderWidth = 1.5;
    self.layer.borderColor = [UIColor colorNamed:@"Little Boy Blue"].CGColor;
}

@end
