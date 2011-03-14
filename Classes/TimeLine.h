//
//  FirstViewController.h
//  Twitter
//
//  Created by masbog on 2/10/11.
//  Copyright masbog inc. 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SA_OAuthTwitterEngine.h"
#import "SA_OAuthTwitterController.h"

@interface TimeLine : UIViewController <UITextFieldDelegate, SA_OAuthTwitterEngineDelegate, SA_OAuthTwitterControllerDelegate>{
//@interface TimeLine : UIViewController <UITextFieldDelegate>{

	UITableView *tableView;
	UITextField *status;
	UIButton *done;
	float x1, x2;
	
	SA_OAuthTwitterEngine *mesin;
	NSMutableArray *tweets;
	NSMutableArray *authors;
}
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UITextField *status;
@property (nonatomic, retain) IBOutlet UIButton *done;

-(IBAction)done:(id)sender;
-(IBAction)update:(id)sender;
- (BOOL) textFieldShouldReturn:(UITextField *)textField; 
@end
