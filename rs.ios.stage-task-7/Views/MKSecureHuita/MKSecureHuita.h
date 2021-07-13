//
//  MKSecureHuita.h
//  rs.ios.stage-task-7
//
//  Created by dev on 13.07.21.
//

#import <UIKit/UIKit.h>
#import "MKSecureTextField.h"
#import "MKSecureButton.h"
#import "MKSuccessProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface MKSecureHuita : UIView

@property (strong, nonatomic) NSMutableArray *arrayOfDigits;
@property (strong, nonatomic) MKSecureTextField *secureTextField;
@property (weak, nonatomic) UIViewController <MKSuccessProtocol> *delegate;

-(void)setError;
-(void)setSuccess;

@end

NS_ASSUME_NONNULL_END
