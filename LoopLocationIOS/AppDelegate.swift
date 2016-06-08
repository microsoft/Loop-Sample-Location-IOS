//
//  AppDelegate.swift
//  SimpleTest
//
//  Created by Xuwen Cao on 5/23/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

import UIKit
import LoopSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, LoopSDKListener {

	var window: UIWindow?
	
	//let appID = "YOUR_APP_ID";
	//let appToken = "YOUR_APP_TOKEN";
	let appID = "google-dev-e5ae23a9";
	let appToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6Imdvb2dsZS1kZXYtZTVhZTIzYTkiLCJhcHBLZXkiOiJiYmNiZmZkMDg3OTYtNGQ2MS1hZjc4LTNkNjczMjZhYzUwMSIsImFsbG93ZWRSb3V0ZXMiOlt7Im1ldGhvZCI6InBvc3QiLCJwYXRoIjoiL3YyLjAvYXBwL2dvb2dsZS1kZXYtZTVhZTIzYTkvdXNlciJ9LHsibWV0aG9kIjoiZGVsZXRlIiwicGF0aCI6Ii92Mi4wL2FwcC9nb29nbGUtZGV2LWU1YWUyM2E5L3VzZXIifSx7Im1ldGhvZCI6InBvc3QiLCJwYXRoIjoiL3YyLjAvYXBwL2dvb2dsZS1kZXYtZTVhZTIzYTkvbG9naW4ifSx7Im1ldGhvZCI6ImdldCIsInBhdGgiOiIvdjIuMC9hcHAvZ29vZ2xlLWRldi1lNWFlMjNhOS91c2VyIn0seyJtZXRob2QiOiJnZXQiLCJwYXRoIjoiL3YyLjAvYXBwL2dvb2dsZS1kZXYtZTVhZTIzYTkvdXNlci9bd2QtXSoifV0sImlhdCI6MTQ2NDg5MTM0NSwiaXNzIjoiTG9vcCBBdXRoIHYyIiwic3ViIjoiZ29vZ2xlLWRldi1lNWFlMjNhOSJ9.-8pSXVEm_ljDXLkjyI-YuK-B5OdRgkitSX1-BFP8qfg";
	
	var loopInitialized = false;
	
	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		// Override point for customization after application launch.
		
		LoopSDK.initialize(self, appID: appID, token: appToken);
		
		return true
	}

	func applicationWillResignActive(application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(application: UIApplication) {
		// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}


	func onLoopInitialized() {
		print("on initialized")

		loopInitialized = true;
	}
	
	func onLoopInitializeError(error: String) {
		print("initialize error \(error)")
		
		loopInitialized = false;
		
	}
}

