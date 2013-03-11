WDUploadProgressView
====================

Upload Progress View to be attached as a header of a UITableView and receive updates about the data connection.

![Screenshot] (https://github.com/sprint84/WDUploadProgressView/blob/master/WDUploadProgressViewSample/Screenshot1.png?raw=true)

## Usage
* Copy the project files and include into your project. Attention to the add the bundle images.

### Initialization

``` objective-c
WDUploadProgressView *progressView = [[WDUploadProgressView alloc] initWithTableView:self.tableView cancelButton:YES];
progressView.delegate = self;
```

### Configuration
``` objective-c
// Add Here an image to show
[progressView setPhotoImage:[UIImage imageNamed:@"flower"]];
	
// Additionally you can set the message at any time (Default: Uploading...)
[progressView setUploadMessage:@"Uploading..."];

// You can customize the progress tint color
[progressView setProgressTintColor:[UIColor whiteColor]];
	
// Additionally you can customize the progress track color
[progressView setProgressTrackColor:[UIColor darkGrayColor]];
```

### Updating
Usually the UIProgressView will be updated by a network class, using a delegate callback method or updating progress block.
For that a delegate was defined in WDClientUploadDelegate.h, which is implemented in WDUploadProgressView and must be passed to the Network class some way.

This delegate protocol implements only one method:

``` objective-c
- (void)uploadDidUpdate:(CGFloat)progress;
```

which should be called after each progress update. The values must be [0.0, 1.0].

#### Dismissing
When the progress reaches 1.0, the view will call a method in the delegate after 2 seconds.
You must remove the progress view from the table view and update your data if necessary.
Beware that completing the upload (sent 100% of data) does not necessarily means that your object is ready. The WDUploadProgressView could be removed from the table view, but your server might still be processing your object.

## Requirements
* WDUploadProgressView requires iOS 5.0 or above.
* ARC memory management. If your project does not use ARC, compile each file with flag -fobjc-arc.
* QuartzCore Framework.
* View with UITableView (requires UITableView header).

## License
WDUploadProgressView is available under the MIT license.

Copyright (c) 2013 Guilherme Moura

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
