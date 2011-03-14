//
//  FirstViewController.m
//  Twitter
//
//  Created by masbog on 2/10/11.
//  Copyright masbog inc. 2011. All rights reserved.
//

#import "TimeLine.h"

@implementation TimeLine

@synthesize tableView;
@synthesize status;
@synthesize done;


///============= update ==========
-(IBAction)update:(id)sender {
	//NSLog(@"touch");
	[mesin sendUpdate:[status text]];
	[done setTitle:@"140" forState:UIControlStateNormal]; 
	[done setTitle:@"140" forState:UIControlStateHighlighted]; 
	[done setTitle:@"140" forState:UIControlStateSelected]; 
	status.text = nil;
}

//============== sisa karakter di klik keyboard menghilang =========
-(IBAction)done:(id)sender {
	[status resignFirstResponder];
	
}
//======= hilangkan keyboard saat return di keyboard di tekan ======
- (BOOL) textFieldShouldReturn:(UITextField *)textField { 
    [status resignFirstResponder]; 
    return YES; 
} 

//============= hitung sisa karakter ============
- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSUInteger newLength = 140 - [status.text length];
	[done setTitle:[NSString stringWithFormat:@"%d", newLength] forState:UIControlStateNormal]; 
	[done setTitle:[NSString stringWithFormat:@"%d", newLength] forState:UIControlStateHighlighted]; 
	[done setTitle:[NSString stringWithFormat:@"%d", newLength] forState:UIControlStateSelected]; 
	
}
//=========== awal fungsi flip saat drag di layar ==================
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch = [touches anyObject];
	CGPoint coord = [touch locationInView:[self view]];
	//NSLog(@"nilai x = %f , y = %f", coord.x, coord.y);
	x1 = coord.x;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch = [touches anyObject];
	CGPoint coord = [touch locationInView:[self view]];
	//NSLog(@"nilai x = %f , y = %f", coord.x, coord.y);
	x2 = coord.x;
		[UIView beginAnimations:@"flipping view" context:nil];
		[UIView setAnimationDuration:1];

	if (x1 >= x2) {
		//NSLog(@"flipping");		
		[UIView setAnimationTransition: UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
	} else {
		[UIView setAnimationTransition: UIViewAnimationTransitionCurlDown forView:self.view.superview cache:YES];
	}
	[UIView commitAnimations];
}

//=========== akhir fungsi flip saat drag di layar =================


//=========== mesin twitter ==================

- (void)viewDidAppear:(BOOL)animated {
	
	if(mesin) return;
	
	mesin = [[SA_OAuthTwitterEngine alloc] initOAuthWithDelegate:self];
	mesin.consumerKey = @"CtNjN5EUNGXLolICrtIhnw";
	mesin.consumerSecret = @"Od9lOuzJIF82OPU5m2VAqPK8Jonft9A0xBAiyQTbyE";
	
	//=============== mengambil variable dari xml twitter ===============
	
	UIViewController *controller = [SA_OAuthTwitterController controllerToEnterCredentialsWithTwitterEngine: mesin delegate: self];
	
	if (controller) 
		[self presentModalViewController: controller animated: YES];
	else {
		tweets = [[NSMutableArray alloc] init];
		authors = [[NSMutableArray alloc] init];
		//[self updateStream:nil];
	}
	//=============== mengambil variable dari xml twitter ===============
}

- (void) storeCachedTwitterOAuthData: (NSString *) data forUsername: (NSString *) username {
	
	NSUserDefaults	*defaults = [NSUserDefaults standardUserDefaults];
	
	[defaults setObject: data forKey: @"authData"];
	[defaults synchronize];
}

- (NSString *) cachedTwitterOAuthDataForUsername: (NSString *) username {
	
	return [[NSUserDefaults standardUserDefaults] objectForKey: @"authData"];
}

#pragma mark SA_OAuthTwitterController Delegate

- (void) OAuthTwitterController: (SA_OAuthTwitterController *) controller authenticatedWithUsername: (NSString *) username {
	
	NSLog(@"Authenticated with user %@", username);
	
	tweets = [[NSMutableArray alloc] init];
	//[self updateStream:nil];
}

- (void) OAuthTwitterControllerFailed: (SA_OAuthTwitterController *) controller {
	
	NSLog(@"Authentication Failure");
}

- (void) OAuthTwitterControllerCanceled: (SA_OAuthTwitterController *) controller {
	
	NSLog(@"Authentication Canceled");
}

#pragma mark MGTwitterEngineDelegate Methods

- (void)requestSucceeded:(NSString *)connectionIdentifier {
	
	NSLog(@"Request Suceeded: %@", connectionIdentifier);
}

//=========== akhir mesin twitter ==================



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return YES;
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
