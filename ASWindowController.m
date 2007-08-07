//
//  ASWindowController.m
//  iSFV
//
//  Created by Albert Sodyl on 06/08/07.
//  Copyright 2007 Eoros. All rights reserved.
//

//	iSFV is free software; you can redistribute it and/or modify
//	it under the terms of the GNU General Public License as published by
//	the Free Software Foundation; either version 3 of the License, or
//	(at your option) any later version.
//
//	iSFV is distributed in the hope that it will be useful,
//	but WITHOUT ANY WARRANTY; without even the implied warranty of
//	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//	GNU General Public License for more details.
//
//	You should have received a copy of the GNU General Public License
//	along with this program.  If not, see <http://www.gnu.org/licenses/>.

#import "ASSFVData.h"
#import "ASWindowController.h"

@implementation ASWindowController

- (void) populateData: (ASSFVData*)data {
	_data = data;
}

- (void) updateData:(int)index percentCompleted:(float)f {
	NSParameterAssert(index >= 0 && index < [_data count]);
	NSString *status = @"Checking ";
	[_status setStringValue:[status stringByAppendingString:[_data fileAtIndex:index]]];
	[status release];
	[_percentage setStringValue:@"0%"];
	[_level setFloatValue:(f*100)];
}

- (void)windowDidLoad {
	[super windowDidLoad];
	if ([_data count] > 0) {
		NSString *status = @"Checking ";
		[_status setStringValue:[status stringByAppendingString:[_data fileAtIndex:0]]];
		[status release];
		[_percentage setStringValue:@"0%"];
	}
	else {
		[_status setStringValue:@""];
		[_percentage setStringValue:@""];
	}
	[_level setFloatValue:0.00];
}

- (void)showWindow:(id)sender {
	[super showWindow:sender];
	[[self document] windowControllerDidLoadNib:self];
}

@end
