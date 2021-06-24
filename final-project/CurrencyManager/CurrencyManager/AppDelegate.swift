//
//  AppDelegate.swift
//  CurrencyManager
//
//  Created by Aws Shkara on 13.05.2021.

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Create root controller and make window visible
		let rootController = HomePageViewController()
		let navigationController = UINavigationController(rootViewController: rootController)
		navigationController.navigationBar.barTintColor = UIColor(red: 0.29, green: 0.565, blue: 0.886, alpha: 1)
		navigationController.navigationBar.tintColor = .white
		navigationController.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
		let window = UIWindow()
		window.rootViewController = navigationController
		if #available(iOS 13.0, *) {
			window.overrideUserInterfaceStyle = .light
		}
		window.makeKeyAndVisible()
		self.window = window
		
		return true
	}
	
}

