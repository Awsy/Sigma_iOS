
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var view = UIViewController()


	// MARK: - Дослідити всі методи UIApplicationDelegate - дослідити всі методи делегату Описати дії які треба виконати для виклику конкретного методу в реалізації методу, скористатися print() функцією для виведення повідомлення в консоль при спрацьовуванні методу делегату.
	
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		return true
	}

	// MARK: UISceneSession Lifecycle

	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
		// Called when a new scene session is being created.
		// Use this method to select a configuration to create the new scene with.
		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}

	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
		// Called when the user discards a scene session.
		// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
		// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
	}
	
	func applicationDidFinishLaunching(_ application: UIApplication) {
		print("App finished launching")
	}
	
	func applicationWillTerminate(_ application: UIApplication) {
		print("App is about to terminate")
	}
	
	func applicationDidBecomeActive(_ application: UIApplication) {
		print("App is active now")
	}
	
	func applicationWillResignActive(_ application: UIApplication) {
		print("App is about to become inactive")
	}
	
	func applicationWillEnterForeground(_ application: UIApplication) {
		print("App is about to enter the background")
	}
	
	func applicationDidEnterBackground(_ application: UIApplication) {
		print("App is now running in the background")
	}
	
	func applicationSignificantTimeChange(_ application: UIApplication) {
		print("Notifies if there is a significant change in time")
	}
	
	func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
		print("There is memory warning from the system")
	}
	
	func applicationShouldRequestHealthAuthorization(_ application: UIApplication) {
		print("App should ask for permission to access the HealthKit data")
	}
	
	func applicationProtectedDataDidBecomeAvailable(_ application: UIApplication) {
		print("Protected files are available now")
	}
	
	func applicationProtectedDataWillBecomeUnavailable(_ application: UIApplication) {
		print("Protected data are about to become unavailable")
	}
	
	func application(_ application: UIApplication, didUpdate userActivity: NSUserActivity) {
		print("User activity was updated")
	}
	
	func application(_ application: UIApplication, didDecodeRestorableStateWith coder: NSCoder) {
		print("Restore high-level state information")
	}
	
	func application(_ application: UIApplication, willEncodeRestorableStateWith coder: NSCoder) {
		print("Save high-level state information at the beginning of state preservation process")
	}
	
	func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
		print("Push notification service cannot complete the registration process, delegate notified")
	}
	
	func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
		print("App successfully registered to the push notification")
	}
	
	func application(_ application: UIApplication, shouldSaveSecureApplicationState coder: NSCoder) -> Bool {
		print("App state should be securely preserved")
		return true
	}
	
	func application(_ application: UIApplication, shouldRestoreSecureApplicationState coder: NSCoder) -> Bool {
		print("App state should be successfully saved by delegate")
		return true
	}
	
	func application(_ application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool {
		print("App's activity takes longer than expected")
		return true
	}
	
	func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
		print("Please use the specified windows indicated in the view controller")
		return [.portrait, .portraitUpsideDown]
	}
	
	func application(_ application: UIApplication, didFailToContinueUserActivityWithType userActivityType: String, error: Error) {
		print("App activity cannot be continued")
	}
	
	func application(_ application: UIApplication, shouldAllowExtensionPointIdentifier extensionPointIdentifier: UIApplication.ExtensionPointIdentifier) -> Bool {
		print("Grant permission to the app extensions that based on specified extension point identified")
		return true
	}
	
	func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {
		print("URL session events are waiting to be processed")
	}
	
	func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
		print("User selected a home screen quick action")
	}
	
	func application(_ application: UIApplication, viewControllerWithRestorationIdentifierPath identifierComponents: [String], coder: NSCoder) -> UIViewController? {
		print("Please provide a view controller")
		return view
	}
	
	func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
		print("Open a URL resource")
		return true
	}
	
	func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		print("Process launched. State restoration has not yet occurred")
		return true
	}
	
	func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
		print("Activity data for continuing is available")
		return true
	}
	
	func application(_ application: UIApplication, handleWatchKitExtensionRequest userInfo: [AnyHashable : Any]?, reply: @escaping ([AnyHashable : Any]?) -> Void) {
		print("Response has to be provided from a paired watchOS app")
	}
	
	func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
		print("There is data to be fetched")
	}


}

