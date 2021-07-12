//
//  MKTextField.m
//  rs.ios.stage-task-7
//
//  Created by dev on 13.07.21.
//

#import "MKTextField.h"

@implementation MKTextField

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.layer setCornerRadius:5];
    [self.layer setBorderWidth:1.5];
}

- (void)setReady {
    self.layer.borderColor = [UIColor colorNamed:@"Black Coral"].CGColor;
    self.enabled = YES;
    self.alpha = 1;
}

- (void)setError {
    self.layer.borderColor = [UIColor colorNamed:@"Venetian Red"].CGColor;
    self.text = @"";
}

- (void)setSuccess {
    self.layer.borderColor = [UIColor colorNamed:@"Turquoise Green"].CGColor;
    self.enabled = NO;
    self.alpha = 0.5;
}

@end
