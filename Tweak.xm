// By @CrazyMind90


#pragma GCC diagnostic ignored "-Wunused-variable"

#define greenColor [UIColor colorWithRed:1/255.0f green:152/255.0f blue:117/255.0f alpha:1.0f]

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CMManager.h"





%group Follow
%hook T1FollowControl
-(void) _followUser:(id)arg event:(id)arg1 {


  [CMManager InitAlertWithTitle:@"Follow ?" Message:nil Buttons:@[@"YES!"] CancelButtonTitle:@"Dismiss" AlertStyle:UIAlertControllerStyleActionSheet handler:^(NSString * _Nullable ButtonTitle) {


        if ([ButtonTitle isEqual:@"YES!"])
             return %orig;

    }];


   return;


}

%end

%end






%hook T1TweetComposeViewController

%group Tweet
-(void) _t1_handleTweet {


  [CMManager InitAlertWithTitle:@"Tweet ?" Message:nil Buttons:@[@"YES!"] CancelButtonTitle:@"Dismiss" AlertStyle:UIAlertControllerStyleActionSheet handler:^(NSString * _Nullable ButtonTitle) {


        if ([ButtonTitle isEqual:@"YES!"])
             return %orig;

    }];


return;

}

%end



%group Retweet
-(void) _t1_handleRetweet {

   [CMManager InitAlertWithTitle:@"Retweet ?" Message:nil Buttons:@[@"YES!"] CancelButtonTitle:@"Dismiss" AlertStyle:UIAlertControllerStyleActionSheet handler:^(NSString * _Nullable ButtonTitle) {


        if ([ButtonTitle isEqual:@"YES!"])
             return %orig;
    }];



return;

}


%end
%end


%group Reply
%hook T1PersistentComposeViewController
-(void) _t1_didTapReply:(id)arg {


  [CMManager InitAlertWithTitle:@"Reply ?" Message:nil Buttons:@[@"YES!"] CancelButtonTitle:@"Dismiss" AlertStyle:UIAlertControllerStyleActionSheet handler:^(NSString * _Nullable ButtonTitle) {


        if ([ButtonTitle isEqual:@"YES!"])
             return %orig;

    }];



  return;
}


%end
%end



%group Like
%hook TFNTwitterAccount
-(void) favoriteStatus:(id)arg responseBlock:(id)arg1 {


	[CMManager InitAlertWithTitle:@"Like ?" Message:nil Buttons:@[@"YES!"] CancelButtonTitle:@"Dismiss" AlertStyle:UIAlertControllerStyleActionSheet handler:^(NSString * _Nullable ButtonTitle) {


        if ([ButtonTitle isEqual:@"YES!"])
             return %orig;

    }];


  return;
}

%end



%hook T1DefaultSlideshowStatusViewActionsDataSource
-(bool)shouldEnableFavoriteActionForStatus:(id)arg1 account:(id)arg2 {

return FALSE;
%orig (NULL, NULL);

}
%end
%end



%group DM
%hook T1DirectMessageComposeViewController
-(void) sendButtonTapped:(id)arg {


		[CMManager InitAlertWithTitle:@"Send ?" Message:nil Buttons:@[@"YES!"] CancelButtonTitle:@"Dismiss" AlertStyle:UIAlertControllerStyleActionSheet handler:^(NSString * _Nullable ButtonTitle) {


	        if ([ButtonTitle isEqual:@"YES!"])
	             return %orig;

	    }];



	  return;

}


%end
%end





%group DMTyping
%hook T1DirectMessageTypingIndicatorController
-(void) publishTypingIndicator {

	  return;
}


%end
%end




%group QR
%hook TFNTwitterAccount
- (bool)isProfileQRCodeButtonEnabled {

	  return YES;
}

- (bool)isQRLoginEnabled {

    return YES;
}

%end
%end


%group TweetVoice
%hook T1PhotoMediaRailViewController
-(bool) isVoiceButtonHidden {

  return NO;
}
%end
%end




%ctor {

%init();

	NSString *PlistPath = @"/var/mobile/Library/Preferences/com.crazymind90.twoptions.plist";

	NSMutableDictionary *MutDoction = [[NSMutableDictionary alloc] initWithContentsOfFile:PlistPath];

	bool Follow = [[MutDoction objectForKey:@"FollowConf"] boolValue];
	bool Tweet = [[MutDoction objectForKey:@"TweetConf"] boolValue];
	bool Retweet = [[MutDoction objectForKey:@"RetweetConf"] boolValue];
	bool Reply = [[MutDoction objectForKey:@"ReplyConf"] boolValue];
	bool Like = [[MutDoction objectForKey:@"LikeConf"] boolValue];
	bool DM = [[MutDoction objectForKey:@"DMConf"] boolValue];
  bool DMTyping = [[MutDoction objectForKey:@"DMTyping"] boolValue];
  bool QR = [[MutDoction objectForKey:@"QR"] boolValue];
  bool TweetVoice = [[MutDoction objectForKey:@"TweetVoice"] boolValue];

	if (Follow)
		%init(Follow);

		if (Tweet)
			%init(Tweet);

			if (Retweet)
				%init(Retweet);

				if (Reply)
					%init(Reply);

					if (Like)
						%init(Like);

						if (DM)
							%init(DM);

              if (DMTyping)
                %init(DMTyping);

                if (QR)
                  %init(QR);

                  if (TweetVoice)
                    %init(TweetVoice);



}












//
