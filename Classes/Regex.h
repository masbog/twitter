//
//  Regex.h
//  Twitter
//
//  Created by masbog on 3/5/11.
//  Copyright 2011 masbog inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Regex : NSObject {
	NSDictionary *contents;
}

-(NSString*)tweet;
-(NSString*)author;

@end
