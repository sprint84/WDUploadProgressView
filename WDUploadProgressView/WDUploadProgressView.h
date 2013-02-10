//
//  UploadProgressView.h
//  Weddine
//
//  Created by Guilherme Moura on 26/01/2013.
//  Copyright (c) 2013 Reefactor, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDClientUploadDelegate.h"

@protocol WDUploadProgressDelegate;

@interface WDUploadProgressView : UIControl <WDClientUploadDelegate>

@property (weak, nonatomic) id<WDUploadProgressDelegate> delegate;
@property (nonatomic) CGFloat progress;
@property (nonatomic) BOOL animatedProgress;
@property (strong, nonatomic) UIColor *progressTintColor;
@property (strong, nonatomic) UIColor *progressTrackColor;
@property (strong, nonatomic) UIImage *photoImage;
@property (strong, nonatomic) NSString *uploadMessage;

- (id)initWithTableView:(UITableView *)tableView;
- (id)initWithTableView:(UITableView *)tableView cancelButton:(BOOL)showButton;

@end

@protocol WDUploadProgressDelegate

- (void)uploadDidFinish:(WDUploadProgressView *)progressView;
@optional
- (void)uploadDidCancel:(WDUploadProgressView *)progressView;


@end