//
//  Options.h
//  Twitter
//
//  Created by masbog on 3/11/11.
//  Copyright 2011 masbog inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SA_OAuthTwitterEngine.h"
#import "SA_OAuthTwitterController.h"

@interface Options : UIViewController<SA_OAuthTwitterEngineDelegate, SA_OAuthTwitterControllerDelegate>{
	UIButton *keluar;
	
	NSMutableArray *tweets;
	NSMutableArray *authors;
	
	SA_OAuthTwitterEngine *mesin;
}
@property (nonatomic, retain)IBOutlet UIButton *keluar;
-(IBAction)keluar:(id)sender;
-(void)login;
@end
