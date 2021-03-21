
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    // insert code here...
	
		
		NSString *str = @"Hello world but in Objective-C";
		NSString *str2 = @" and everyone else";
		
		NSLog(@"%@", [str stringByAppendingString:str2]);
		
	}
	return 0;
}
