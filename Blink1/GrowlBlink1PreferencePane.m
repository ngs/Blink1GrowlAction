//
//  GrowlBlink1PreferencePane.m
//  Blink1
//
//  Created by Atsushi Nagase on 1/18/13.
//  Copyright (c) 2013 LittleApps Inc. All rights reserved.
//
//  This class represents your plugin's preference pane.  There will be only one instance, but possibly many configurations
//  In order to access a configuration values, use the NSMutableDictionary *configuration for getting them.
//  In order to change configuration values, use [self setConfigurationValue:forKey:]
//  This ensures that the configuration gets saved into the database properly.

#import "GrowlBlink1PreferencePane.h"

@implementation GrowlBlink1PreferencePane

- (void)awakeFromNib {
  [self.tableView registerForDraggedTypes:@[@"NSMutableDictionary"]];
}

-(NSString*)mainNibName {
	return @"Blink1PrefPane";
}

/* This returns the set of keys the preference pane needs updated via bindings
 * This is called by GrowlPluginPreferencePane when it has had its configuration swapped
 * Since we really only need a fixed set of keys updated, use dispatch_once to create the set
 */
- (NSSet*)bindingKeys {
	static NSSet *keys = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		keys = [NSSet set];
	});
	return keys;
}

/* This method is called when our configuration values have been changed
 * by switching to a new configuration.  This is where we would update certain things
 * that are unbindable.  Call the super version in order to ensure bindingKeys is also called and used.
 * Uncomment the method to use.
 */
/*
 -(void)updateConfigurationValues {
 [super updateConfigurationValues];
 }
 */


#pragma mark - NSTableViewDataSource

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
  return 5;
}

- (BOOL)tableView:(NSTableView *)tableView acceptDrop:(id<NSDraggingInfo>)info
              row:(NSInteger)row dropOperation:(NSTableViewDropOperation)dropOperation {
  return YES;
}

- (NSDragOperation)tableView:(NSTableView *)tableView validateDrop:(id<NSDraggingInfo>)info
                 proposedRow:(NSInteger)row proposedDropOperation:(NSTableViewDropOperation)dropOperation {
  return NSDragOperationEvery;
}

- (BOOL)tableView:(NSTableView *)tableView writeRowsWithIndexes:(NSIndexSet *)rowIndexes
     toPasteboard:(NSPasteboard *)pboard {
  return YES;
}

- (void)tableView:(NSTableView *)tableView setObjectValue:(id)object
   forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
}

- (NSCell *)tableView:(NSTableView *)tableView dataCellForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
  return [[NSTextFieldCell alloc] initTextCell:@"Test"];
}


#pragma mark - NSTableViewDelegate

@end
