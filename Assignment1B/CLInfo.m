#import <Foundation/Foundation.h>

// Section 1
void PrintPathInfo() { 
	NSString *path = @"~";
	NSString *homeFolder = [path stringByExpandingTildeInPath];
	NSLog(@"My home folder is at: '%@'", homeFolder);
	
	NSArray *components = [homeFolder pathComponents];
	for(NSString *component in components) {
		NSLog(@"%@", component);
	}
} 

// Section 2
void PrintProcessInfo() {
	NSProcessInfo *processInfo = [NSProcessInfo processInfo];
	NSString *processName = [processInfo processName];
	int processID = [processInfo processIdentifier];
	
	NSLog(@"Process Name: %@ Process Info: %d", processName, processID);
}

// Section 3
void PrintBookmarkInfo() {
	NSDictionary *bookmarks;
	bookmarks = [[NSDictionary alloc] initWithObjectsAndKeys:
		[NSURL URLWithString:@"http://www.stanford.edu"], @"Stanford University",
		[NSURL URLWithString:@"http://www.apple.com"], @"Apple",
		[NSURL URLWithString:@"http://cs193p.stanford.edu"], @"CS193P",
		[NSURL URLWithString:@"http://itunes.stanford.edu"], @"Stanford on iTunes U",
		[NSURL URLWithString:@"http://stanfordshop.com"], @"Stanford Mall",
		 nil];
	for(NSString *key in bookmarks) {
		if([key hasPrefix:@"Stanford"]) {
			NSURL *url = [bookmarks objectForKey:key];
			NSLog(@"Key: '%@' URL: '%@'", key, url);
		}
	}
	
	[bookmarks release];
}

void PrintIntrospectionInfo() {
	NSMutableArray *variousObjects = [[NSMutableArray alloc] init];
	
	[variousObjects addObject:[NSMutableString stringWithString:@"Mutable String"]];
	[variousObjects addObject:[NSURL URLWithString:@"http://www.apple.com"]];
	[variousObjects addObject:[NSDictionary dictionary]];
	[variousObjects addObject:@"String"];
	
	for(id object in variousObjects) {
		NSLog(@"Class name: %@", [object class]);
		
		bool isMemberOfNSString = [object isMemberOfClass:[NSString class]];
		if(isMemberOfNSString) {
			NSLog(@"Is Member of NSString: YES");
		} else {
			NSLog(@"Is Member of NSString: NO");
		}
		
		bool isKindOfNSString = [object isKindOfClass:[NSString class]];
		if(isKindOfNSString) {
			NSLog(@"Is Kind of NSString: YES");
		} else {
			NSLog(@"Is Kind of NSString: NO");
		}
		
		bool respondsToLowercaseString = [object respondsToSelector:@selector(lowercaseString)];
		if(respondsToLowercaseString) {
			NSLog(@"Responds to lowercaseString: YES");
			NSLog(@"lowercaseString: %@", [object lowercaseString]);
		} else {
			NSLog(@"Responds to lowercaseString: NO");
		}
		
		NSLog(@"======================================");
	}
	
	[variousObjects release];
}

void PrintSeperator() {
	NSLog(@"---");
}

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	PrintPathInfo();           // Section 1 
	PrintSeperator();
	PrintProcessInfo();        // Section 2
	PrintSeperator();
	PrintBookmarkInfo();       // Section 3
	PrintSeperator();
	PrintIntrospectionInfo();  // Section 4
	
    [pool drain];
    return 0;
}
