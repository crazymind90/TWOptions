#include "TWOptionsController.h"
#include <spawn.h>

@implementation TWOptionsController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

-(void) ApplyChanges {
    
    pid_t pid;
    const char* args[] = {"killall", "backboardd", NULL};
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
    
}



-(void) CrazyTwitter {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/CrazyMind90"] options:@{} completionHandler:nil];
    
}


@end
