//
//  GvnrsIslandAppDelegate.h
//  GvnrsIsland
//
//  Created by Phillip Gulla on 11/18/12.
//  Copyright (c) 2012 Allug. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface GvnrsIslandAppDelegate : UIResponder <UIApplicationDelegate> {
	View *view;
	UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;

@end
