//
//  APIClientUploadDelegate.h
//  Weddine
//
//  Created by Guilherme Moura on 09/02/2013.
//  Copyright (c) 2013 Reefactor, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WDClientUploadDelegate <NSObject>

- (void)uploadDidUpdate:(CGFloat)progress;

@end
