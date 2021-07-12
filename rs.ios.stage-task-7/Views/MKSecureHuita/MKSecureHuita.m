//
//  MKSecureHuita.m
//  rs.ios.stage-task-7
//
//  Created by dev on 13.07.21.
//

#import "MKSecureHuita.h"

@implementation MKSecureHuita

-(void)awakeFromNib {
    [super awakeFromNib];
    self.hidden = YES;
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderColor = [UIColor clearColor].CGColor;
    self.layer.cornerRadius = 10;
    self.layer.borderWidth = 2;
    self.arrayOfDigits = [[NSMutableArray alloc] init];
}

-(void)setError {
    [self.arrayOfDigits removeAllObjects];
    self.layer.borderColor = [UIColor colorNamed:@"Venetian Red"].CGColor;
}

-(void)setSuccess {
    self.layer.borderColor = [UIColor colorNamed:@"Turquoise Green"].CGColor;
}

@end
