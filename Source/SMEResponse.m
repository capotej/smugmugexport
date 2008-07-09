//
//  SMEResponse.m
//  SmugMugExport
//
//  Created by Aaron Evans on 6/28/08.
//  Copyright 2008 Aaron Evans. All rights reserved.
//

#import "SMEResponse.h"
#import "SMEDecoder.h"
#import "SMEGlobals.h"

@interface SMEResponse (Private)
-(NSDictionary *)decodedResponse:(NSData *)data decoder:(NSObject<SMEDecoder> *)decoder;
@end

@implementation SMEResponse

-(id)initWithData:(NSData *)data decoder:(NSObject<SMEDecoder> *)aDecoder {
	if( ! (self = [super init]))
		return nil;
	
	
	@try {		
		response = IsEmpty(data) ? nil : [[self decodedResponse:data decoder:aDecoder] retain];
	} @catch (NSException *ex) {
		NSLog(@"Error decoding response: %@", ex);
		response = nil;
	}
	
	return self;
}

+(SMEResponse *)responseWithData:(NSData *)data decoder:(NSObject<SMEDecoder> *)aDecoder {
	return [[[[self class] alloc] initWithData:data decoder:aDecoder] autorelease];
}

-(void)dealloc {
	[response release];
	[smData release];
	
	[super dealloc];
}

-(NSDictionary *)response {
	return response;
}

-(unsigned int)code {
	return [[response objectForKey:@"code"] intValue];
}

-(NSString *)errorMessage {
	return response == nil ? 
		NSLocalizedString(@"No data in response", @"Error message when no response is received.") : 
		[response objectForKey:@"message"];
}

-(NSDictionary *)decodedResponse:(NSData *)data decoder:(NSObject<SMEDecoder> *)decoder {	
	return [decoder decodedResponse:data];
}

-(BOOL)wasSuccessful {
	return [[response objectForKey:@"stat"] isEqualToString:@"ok"];
}

-(id)smData {
	return smData;
}

-(void)setSMData:(id)data {
	if(data != smData) {
		[smData release];
		smData = [data retain];
	}
}

@end
