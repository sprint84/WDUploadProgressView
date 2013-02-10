//
//  DummyConnection.h
//  WDUploadProgressViewSample
//
//  Created by Guilherme Moura on 10/02/2013.
//  Copyright (c) 2013 Guilherme Moura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDClientUploadDelegate.h"

@interface DummyConnection : NSObject

@property (weak, nonatomic) id<WDClientUploadDelegate> delegate;

- (id)initWithDelegate:(id<WDClientUploadDelegate>)delegate;

@end
