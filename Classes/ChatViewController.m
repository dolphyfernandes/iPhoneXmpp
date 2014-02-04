//
//  ChatViewController.m
//  iPhoneXMPP
//
//  Created by Dolphy Fernandes on 1/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ChatViewController.h"
#import "XMPPFramework.h"
#import "iPhoneXMPPAppDelegate.h"

@implementation ChatViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (iPhoneXMPPAppDelegate *)appDelegate
{
	return (iPhoneXMPPAppDelegate *)[[UIApplication sharedApplication] delegate];
}
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] 
                                   initWithTarget:self 
                                   action:@selector(tapGesture:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    
    UILongPressGestureRecognizer* longPress = [[UILongPressGestureRecognizer alloc]
                                               initWithTarget:self
                                               action:@selector(longPressGesture:)];
//    longPress.minimumPressDuration = 1.0;
    [self.view addGestureRecognizer:tap];
    [self.view addGestureRecognizer:longPress];
//    [tap release];
}

- (void)tapGesture:(UIGestureRecognizer*)gesture {
    // Do something
    NSLog(@".");
}

- (void) longPressGesture:(UIGestureRecognizer*) gesture {
    if (gesture.state == UIGestureRecognizerStateEnded) {
//        NSLog(@"Long press Ended");
    }
    else {
        NSLog(@"_");
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void) viewDidAppear:(BOOL)animated {
    /*
     NSXMLElement *body = [NSXMLElement elementWithName:@"body"];
     [body setStringValue:@"Hey"];
     
     NSXMLElement *message = [NSXMLElement elementWithName:@"message"];
     [message addAttributeWithName:@"type" stringValue:@"chat"];
     [message addAttributeWithName:@"to" stringValue:@"leena.bondale@gmail.com"];
     [message addChild:body];
     
     [[[self appDelegate] xmppStream] sendElement:message];
     */
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    NSXMLElement *body = [NSXMLElement elementWithName:@"body"];
    [body setStringValue:@"hielow"];
    
    NSXMLElement *message = [NSXMLElement elementWithName:@"message"];
    [message addAttributeWithName:@"type" stringValue:@"chat"];
    [message addAttributeWithName:@"to" stringValue:@"leena.bondale@gmail.com"];
    [message addChild:body];
    
    [[[self appDelegate] xmppStream] sendElement:message];

    return NO;
}

@end
