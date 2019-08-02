//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <ace_bottom_navigation_bar/AceBottomNavigationBarPlugin.h>
#import <fluttertoast/FluttertoastPlugin.h>
#import <shared_preferences/SharedPreferencesPlugin.h>
#import <url_launcher/UrlLauncherPlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [AceBottomNavigationBarPlugin registerWithRegistrar:[registry registrarForPlugin:@"AceBottomNavigationBarPlugin"]];
  [FluttertoastPlugin registerWithRegistrar:[registry registrarForPlugin:@"FluttertoastPlugin"]];
  [FLTSharedPreferencesPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharedPreferencesPlugin"]];
  [FLTUrlLauncherPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTUrlLauncherPlugin"]];
}

@end
