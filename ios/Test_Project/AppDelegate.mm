#import "AppDelegate.h"
#import <ReactNativeNavigation/ReactNativeNavigation.h>
//#import "NavigationiOSFunctions-Swift.h"
#import "Test_Project-Swift.h"
#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>

#import <React/RCTAppSetupUtils.h>

//#import <React/RCTLinkingManager.h>

#if RCT_NEW_ARCH_ENABLED
#import <React/CoreModulesPlugins.h>
#import <React/RCTCxxBridgeDelegate.h>
#import <React/RCTFabricSurfaceHostingProxyRootView.h>
#import <React/RCTSurfacePresenter.h>
#import <React/RCTSurfacePresenterBridgeAdapter.h>
#import <ReactCommon/RCTTurboModuleManager.h>

#import <react/config/ReactNativeConfig.h>

//#import "NavigationiOSFunctions-Swift.h"
#import "MyCustomModule-Bridging-Header.h"
//#import "NavigationiOSFunctions-Swift.h"
//#import "UtilityFunctions-Swift.h"

//@class UtilityFunctions

@interface RCT_EXTERN_MODULE(MyCustomModule, NSObject)

@interface AppDelegate () <RCTCxxBridgeDelegate, RCTTurboModuleManagerDelegate> {
  RCTTurboModuleManager *_turboModuleManager;
  RCTSurfacePresenterBridgeAdapter *_bridgeAdapter;
  std::shared_ptr<const facebook::react::ReactNativeConfig> _reactNativeConfig;
  facebook::react::ContextContainer::Shared _contextContainer;
}
@end
#endif

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  RCTAppSetupPrepareApp(application);

  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];
[ReactNativeNavigation bootstrapWithBridge:bridge];
  
//  [MyCustomModule MyCustomModule];
  
#if RCT_NEW_ARCH_ENABLED
  _contextContainer = std::make_shared<facebook::react::ContextContainer const>();
  _reactNativeConfig = std::make_shared<facebook::react::EmptyReactNativeConfig const>();
  _contextContainer->insert("ReactNativeConfig", _reactNativeConfig);
  _bridgeAdapter = [[RCTSurfacePresenterBridgeAdapter alloc] initWithBridge:bridge contextContainer:_contextContainer];
  bridge.surfacePresenter = _bridgeAdapter.surfacePresenter;
#endif

  

  

  return YES;
}

//- (BOOL)application:(UIApplication *)application
//   openURL:(NSURL *)url
//   options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
//{
//
//  return [RCTLinkingManager application:application openURL:url options:options];
//}

- (BOOL)application:(UIApplication *)application
   openURL:(NSURL *)url
   options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
  NSLog(@"DeepLink URL: %@", url);
  NSLog(@"DeepLink Path: %@", url.path);
  
  
  NSString *pathStr = [url absoluteString];;
  NSArray *pathComponents = [pathStr componentsSeparatedByString:@"//"];
  NSString *extractedString = [pathComponents objectAtIndex:1];

//  NSString *inputString = @"openScreen";

  if ([extractedString isEqualToString:@"openScreen"]) {
    
      NSLog(@"Input string is 'openScreen'");
      
    
    UtilityFunctions *swiftInstance = [[UtilityFunctions alloc] init];
       
    NSString *viewControllerName = @"desiredViewController";
        [swiftInstance navigateFirstViewControllerWithName:viewControllerName];
      
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"main" bundle:nil];
//    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"FirstViewController"];
//
//    UINavigationController *navVC = (UINavigationController *)[UIApplication sharedApplication].delegate.window.rootViewController;
//    [navVC pushViewController:viewController animated:YES];
    
  } else if ([extractedString isEqualToString:@"openSecondScreen"]) {
      NSLog(@"Input string is 'openSecondScreen'");
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"main" bundle:nil];
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];

    UINavigationController *navVC = (UINavigationController *)[UIApplication sharedApplication].delegate.window.rootViewController;
    [navVC pushViewController:viewController animated:YES];
  }
//  else {
//      NSLog(@"Input string is neither 'openScreen' nor 'closeScreen'");
//  }

  
//  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"main" bundle:nil];
//  UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"FirstViewController"];
//
//  UINavigationController *navVC = (UINavigationController *)[UIApplication sharedApplication].delegate.window.rootViewController;
//  [navVC pushViewController:viewController animated:YES];

  
  return true;
}

- (NSArray<id<RCTBridgeModule>> *)extraModulesForBridge:(RCTBridge *)bridge {
  return [ReactNativeNavigation extraModulesForBridge:bridge];
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

#if RCT_NEW_ARCH_ENABLED

#pragma mark - RCTCxxBridgeDelegate

- (std::unique_ptr<facebook::react::JSExecutorFactory>)jsExecutorFactoryForBridge:(RCTBridge *)bridge
{
  _turboModuleManager = [[RCTTurboModuleManager alloc] initWithBridge:bridge
                                                             delegate:self
                                                            jsInvoker:bridge.jsCallInvoker];
  return RCTAppSetupDefaultJsExecutorFactory(bridge, _turboModuleManager);
}

#pragma mark RCTTurboModuleManagerDelegate

- (Class)getModuleClassFromName:(const char *)name
{
  return RCTCoreModulesClassProvider(name);
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                      jsInvoker:(std::shared_ptr<facebook::react::CallInvoker>)jsInvoker
{
  return nullptr;
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                     initParams:
                                                         (const facebook::react::ObjCTurboModule::InitParams &)params
{
  return nullptr;
}

- (id<RCTTurboModule>)getModuleInstanceFromClass:(Class)moduleClass
{
  return RCTAppSetupDefaultModuleFromClass(moduleClass);
}

#endif

@end
