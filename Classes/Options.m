    //
//  Options.m
//  Twitter
//
//  Created by masbog on 3/11/11.
//  Copyright 2011 masbog inc. All rights reserved.
//

#import "Options.h"
#import "TimeLine.h"

@implementation Options

@synthesize keluar;
TimeLine *timeline;
-(IBAction)keluar:(id)sender{
	//[mesin sendUpdate:@"udod udod"];
	NSLog(@"keluar oi keluar : %@", [[NSUserDefaults standardUserDefaults] dictionaryRepresentation]);
	[[NSUserDefaults standardUserDefaults] removeObjectForKey:@"authData"];
	timeline = [[TimeLine alloc]initWithNibName:@"TimeLine" bundle:nil];
	//[[self navigationController] pushViewController:timeline animated:YES];
	
	[self login];
	
	self.tabBarController.selectedViewController = timeline; 
	self.tabBarController.selectedViewController = [self.tabBarController.viewControllers objectAtIndex:0];
	

}

//======================================== mesin twitter =============

//================ void LOGIN ==============

- (void)login{
	//if(mesin) return;
	
	[[NSUserDefaults standardUserDefaults] removeObjectForKey:@"authData"];
	
	mesin = [[SA_OAuthTwitterEngine alloc] initOAuthWithDelegate:self];
	mesin.consumerKey = @"CtNjN5EUNGXLolICrtIhnw";
	mesin.consumerSecret = @"Od9lOuzJIF82OPU5m2VAqPK8Jonft9A0xBAiyQTbyE";
	
	UIViewController *controller = [SA_OAuthTwitterController controllerToEnterCredentialsWithTwitterEngine: mesin delegate: self];
	
	if (controller) 
		[self presentModalViewController: controller animated: YES];
	else {
		tweets = [[NSMutableArray alloc] init];
		authors = [[NSMutableArray alloc] init];
		//[self updateStream:nil];
	}
	
}

//=========== akhir void LOGIN ==============

- (void)viewDidAppear:(BOOL)animated {
	
	}

- (void) storeCachedTwitterOAuthData: (NSString *) data forUsername: (NSString *) username {
	
	NSUserDefaults	*defaults = [NSUserDefaults standardUserDefaults];
	
	[defaults setObject: data forKey: @"authData"];
	[defaults synchronize];
}

- (NSString *) cachedTwitterOAuthDataForUsername: (NSString *) username {
	
	return [[NSUserDefaults standardUserDefaults] objectForKey: @"authData"];
}

//=========== akhir mesin twitter ==================


// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
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


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[TimeLine release];
    [super dealloc];
}


@end
