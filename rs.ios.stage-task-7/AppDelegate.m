//
//  AppDelegate.m
//  rs.ios.stage-task-7
//
//  Created by dev on 5.07.21.
//

#import "AppDelegate.h"
#import "MKViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[MKViewController alloc] initWithNibName:@"MKViewController" bundle:nil];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
