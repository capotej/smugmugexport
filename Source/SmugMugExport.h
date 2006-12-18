//
//  SmugmugExport.h
//  SmugMugExport
//
//  Created by Aaron Evans on 10/7/06.
//  Copyright 2006 Aaron Evans. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class SmugMugManager, ExportMgr, AccountManager;
@protocol ExportPluginProtocol, SmugMugManagerDelegate;

@interface SmugMugExport : NSObject <ExportPluginProtocol, SmugMugManagerDelegate> {
	IBOutlet id firstView;
	IBOutlet id lastView;
	IBOutlet NSBox *settingsBox;
	IBOutlet NSPanel *uploadPanel;
	IBOutlet NSPanel *loginPanel;
	IBOutlet NSPopUpButton *acccountPopupButton;
	IBOutlet NSArrayController *albumsArrayController;

	NSString *username;  // this is the username bound to the textfield
	NSString *password; // the password bound to the textfield
	NSString *sessionUploadStatusText;
	NSString *statusText;
	NSNumber *fileUploadProgress;
	NSNumber *sessionUploadProgress;
	NSString *loginSheetStatusMessage;
	BOOL loginSheetIsBusy;
	BOOL isFocused;
	BOOL isBusy;
	BOOL loginAttempted;
	NSData *currentThumbnailData;

	int imagesUploaded;
	ExportMgr *exportManager;
	SmugMugManager *smugMugManager;
	AccountManager *accountManager;
}

-(IBAction)cancelUpload:(id)sender;
-(IBAction)cancelLoginSheet:(id)sender;
-(IBAction)donate:(id)sender;
-(IBAction)showLoginPanel:(id)sender;
-(IBAction)performLoginFromSheet:(id)sender;

@end