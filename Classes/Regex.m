//
//  Regex.m
//  Twitter
//
//  Created by masbog on 3/5/11.
//  Copyright 2011 masbog inc. All rights reserved.
//

#import "Regex.h"


@implementation Regex

-(id)initWithTweetDictionary:(NSDictionary*)_contents {
	
	if(self = [super init]) {
		
		contents = _contents;
		[contents retain];
	}
	
	return self;
}

-(NSString*)tweet {
	
	return [contents objectForKey:@"text"];
}

-(NSString*)author {
	
	return [[contents objectForKey:@"user"] objectForKey:@"screen_name"];
}
@end
