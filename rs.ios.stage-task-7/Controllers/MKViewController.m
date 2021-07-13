//
//  MKViewController.m
//  rs.ios.stage-task-7
//
//  Created by dev on 5.07.21.
//

#import "MKViewController.h"

@interface MKViewController ()

@property (weak, nonatomic) IBOutlet MKTextField *loginTextField;
@property (weak, nonatomic) IBOutlet MKTextField *passwordTextField;
@property (weak, nonatomic) IBOutlet MKAuthorizeButton *authorizeButton;
@property (weak, nonatomic) IBOutlet MKSecureHuita *secureHuita;
@property (weak, nonatomic) IBOutlet MKSecureTextField *secureTextField;

@end


@implementation MKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureKeyboard];
    self.secureHuita.delegate = self;
    self.secureHuita.secureTextField = self.secureTextField;
}

#pragma mark - Keyboard on tap and return hiding configuration
- (void)configureKeyboard {
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action: @selector(hideKeyboard)]];
}

- (void)hideKeyboard {
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self hideKeyboard];
    return YES;
}

#pragma mark - Authorize Actions
- (IBAction)buttonAction:(UIButton *)sender {
    [self login];
    [sender changeToHighlighted:FALSE];
}

- (IBAction)touchDownButton:(UIButton *)sender {
    [sender changeToHighlighted: TRUE];
}

#pragma mark - TextField Actions

- (IBAction)textFieldAction:(MKTextField *)sender {
    [sender setReady];
}

#pragma mark - SecureHuita Actions

- (IBAction)touchUpSecureButtonAction:(UIButton *)sender {
    [self.secureHuita.arrayOfDigits addObject:[NSString stringWithFormat:@"%@", sender.titleLabel.text]];
    [sender changeToHighlighted:FALSE];
    
    [self.secureHuita.secureTextField setText:[self.secureHuita.arrayOfDigits componentsJoinedByString:@" "]];
    
    if (self.secureHuita.arrayOfDigits.count == 3) {
        if ([[self.secureHuita.arrayOfDigits componentsJoinedByString:@""] isEqual:@"132"]) {
            [self.secureHuita setSuccess];
        } else {
            [self.secureHuita setError];
        }
    }
}

- (IBAction)touchDownSecureButton:(id)sender{
    [sender changeToHighlighted:YES];
}

#pragma mark - Help Methods
-(void) login {
    bool login = [self.loginTextField.text isEqualToString:@"username"];
    bool password = [self.passwordTextField.text isEqualToString:@"password"];
    
    if (login && password) {
        [self.loginTextField setSuccess];
        [self.passwordTextField setSuccess];
        self.authorizeButton.enabled = NO;
        self.authorizeButton.alpha = 0.5;
        self.secureHuita.hidden = NO;
    } else if (!login && !password) {
        [self.loginTextField setError];
        [self.passwordTextField setError];
    } else if (!login){
        [self.loginTextField setError];
    } else if (!password){
        [self.passwordTextField setError];
    }
}

- (void)success {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"WELCOME"
                                                                             message:@"You are successfully authorized!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Refresh"
                                                     style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction * _Nonnull action) {
    [self.loginTextField setReady];
    [self.loginTextField setText:@""];
    [self.passwordTextField setReady];
    [self.passwordTextField setText:@""];
    self.authorizeButton.enabled = YES;
    self.authorizeButton.alpha = 1;
    self.secureHuita.layer.borderColor = [UIColor clearColor].CGColor;
    self.secureHuita.hidden = YES;
    [self.secureHuita.secureTextField setText:@"_"];
    [self.secureHuita.arrayOfDigits removeAllObjects];
}];
    [alertController addAction:action];
    [self presentModalViewController:alertController animated:YES];
}

@end

