//
//  DummyConnection.m
//  WDUploadProgressViewSample
//
//  Created by Guilherme Moura on 10/02/2013.
//  Copyright (c) 2013 Guilherme Moura. All rights reserved.
//

#import "DummyConnection.h"

@implementation DummyConnection

- (id)initWithDelegate:(id<WDClientUploadDelegate>)delegate {
	self = [super init];
	if (self) {
		self.delegate = delegate;
		
		// Start a background process to update the upload view
		[self startUploadProgress];
	}
	
	return self;
}

- (void)startUploadProgress {
	[self performSelector:@selector(setUploadProgress:) withObject:[NSNumber numberWithFloat:0.0] afterDelay:0];
	
	[self performSelector:@selector(setUploadProgress:) withObject:[NSNumber numberWithFloat:0.2] afterDelay:1];
	
	[self performSelector:@selector(setUploadProgress:) withObject:[NSNumber numberWithFloat:0.3] afterDelay:3];
	
	[self performSelector:@selector(setUploadProgress:) withObject:[NSNumber numberWithFloat:0.6] afterDelay:4];
	
	[self performSelector:@selector(setUploadProgress:) withObject:[NSNumber numberWithFloat:0.7] afterDelay:5];
	
	[self performSelector:@selector(setUploadProgress:) withObject:[NSNumber numberWithFloat:1.0] afterDelay:8];
}

- (void)setUploadProgress:(NSNumber *)progress {
	[self.delegate uploadDidUpdate:[progress floatValue]];
}

@end
