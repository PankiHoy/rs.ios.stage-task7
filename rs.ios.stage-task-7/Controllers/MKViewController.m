//
//  MKViewController.m
//  rs.ios.stage-task-7
//
//  Created by dev on 5.07.21.
//

#import "MKViewController.h"

@interface MKViewController ()

@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *authorizeButton;
@property (weak, nonatomic) IBOutlet UIView *secureHuita;
@property (weak, nonatomic) IBOutlet UILabel *secureTextField;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button1;

@end


@implementation MKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureKeyboard];
    [self configureTextFields];
    [self configureButton];
    [self configureSecureHuitu];
    self.secureDigitsMutableArray = [[NSMutableArray alloc] init];
}

#pragma mark - TextFields Configuration
- (void)configureTextFields {
    [self makeRSTextField:self.loginTextField];
    self.loginTextField.delegate = self;
    [self makeRSTextField:self.passwordTextField];
    self.passwordTextField.delegate = self;
}

- (void)makeRSTextField:(UITextField*) sender {
    [sender.layer setCornerRadius:5];
    [sender.layer setBorderWidth:1.5];
}

- (void)setReady:(UITextField*) sender {
    sender.layer.borderColor = [UIColor colorNamed:@"Black Coral"].CGColor;
    sender.enabled = YES;
    sender.alpha = 1;
}

- (void)setError:(UITextField*) sender {
    sender.layer.borderColor = [UIColor colorNamed:@"Venetian Red"].CGColor;
    sender.text = @"";
}

- (void)setSuccess:(UITextField*) sender {
    sender.layer.borderColor = [UIColor colorNamed:@"Turquoise Green"].CGColor;
    sender.enabled = NO;
    sender.alpha = 0.5;
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

#pragma mark - Button configuration
- (void) configureButton {
    self.authorizeButton.layer.borderColor = [UIColor colorNamed:@"Little Boy Blue"].CGColor;
    self.authorizeButton.layer.borderWidth = 2;
    self.authorizeButton.layer.cornerRadius = 10;
    [self.authorizeButton setImage:[UIImage imageNamed:@"personfill"] forState:UIControlStateHighlighted];
    [self.authorizeButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 5)];
    [self.authorizeButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
    self.authorizeButton.clipsToBounds = YES;
}

-(void)changeToHighlighted:(BOOL)check {
    [self.authorizeButton setHighlighted:YES];
    if (check) {
        self.authorizeButton.backgroundColor = [[UIColor colorNamed:@"Little Boy Blue"] colorWithAlphaComponent:0.2];
        self.authorizeButton.titleLabel.alpha = 0.4;
    } else {
        self.authorizeButton.backgroundColor = [UIColor whiteColor];
        self.authorizeButton.titleLabel.alpha = 1;
    }
}

#pragma mark - Actions
- (IBAction)buttonAction:(id)sender {
    [self login];
    [self changeToHighlighted:FALSE];
}

- (IBAction)touchDownButton:(id)sender {
    [self changeToHighlighted: TRUE];
}

- (IBAction)TextFieldAction:(id)sender {
    [self setReady:sender];
}

- (IBAction)secureButtonAction:(UIButton *)sender {
    [self.secureDigitsMutableArray addObject:[NSString stringWithFormat:@"%@ ", sender.titleLabel.text]];
    NSMutableString *string = [[NSMutableString alloc] init];
    for (int i=0; i<self.secureDigitsMutableArray.count; i++) {
        [string appendString:self.secureDigitsMutableArray[i]];
    }
    [self.secureTextField setText:string];
    
    if (self.secureDigitsMutableArray.count == 3) {
        if ([string isEqualToString:@"1 3 2 "]) {
            self.secureHuita.layer.borderColor = [UIColor colorNamed:@"Turquoise Green"].CGColor;
            [self successNotification];
        } else {
            [self.secureTextField setText:@"_"];
            [self.secureDigitsMutableArray removeAllObjects];
            self.secureHuita.layer.borderColor = [UIColor colorNamed:@"Venetian Red"].CGColor;
        }
    }
    
}


#pragma mark - Login
-(void) login {
    bool login = [self.loginTextField.text isEqualToString:@"username"];
    bool password = [self.passwordTextField.text isEqualToString:@"password"];
    
    if (login && password) {
        [self setSuccess:self.loginTextField];
        [self setSuccess:self.passwordTextField];
        self.authorizeButton.enabled = NO;
        self.authorizeButton.alpha = 0.5;
        self.secureHuita.hidden = NO;
    } else if (!login && !password) {
        [self setError:self.loginTextField];
        [self setError:self.passwordTextField];
    } else if (!login){
        [self setError:self.loginTextField];
    } else if (!password){
        [self setError:self.passwordTextField];
    }
}

#pragma mark - Secure huita configuration
- (void)configureSecureHuitu {
    [self.secureHuita setHidden:YES];
    self.secureHuita.backgroundColor = [UIColor whiteColor];
    self.secureHuita.layer.borderColor = [UIColor clearColor].CGColor;
    self.secureHuita.layer.cornerRadius = 10;
    self.secureHuita.layer.borderWidth = 2;
    
    NSArray *secureButtonsArray = [NSArray arrayWithObjects:self.button1, self.button2, self.button3, nil];
    for (UIButton *secureButton in secureButtonsArray) {
        [secureButton.layer setCornerRadius:25];
        [secureButton.layer setBorderWidth:1.5];
        [secureButton.layer setBorderColor:[UIColor colorNamed:@"Little Boy Blue"].CGColor];
    }
}

- (void)successNotification {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"WELCOME"
                                                                             message:@"You are successfully authorized!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Refresh"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * _Nonnull action) {
        [self setReady:self.passwordTextField];
        [self setReady:self.loginTextField];
        [self.passwordTextField setText:@""];
        [self.loginTextField setText:@""];
        [self.secureTextField setText:@"_"];
        [self.secureDigitsMutableArray removeAllObjects];
        self.secureHuita.layer.borderColor = [UIColor clearColor].CGColor;
        self.secureHuita.hidden = YES;
        self.authorizeButton.enabled = YES;
        self.authorizeButton.alpha = 1;
    }];
    [alertController addAction:action];
    [self presentModalViewController:alertController animated:YES];
}

@end

