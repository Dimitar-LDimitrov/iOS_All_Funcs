//
//  AppDelegate.swift
//  iOS-AllFuncs
//
//  Created by Dimitar Dimitrov on 11.05.23.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // enable Firestore library
        FirebaseApp.configure()
        
        // enable keyboard manager 3rd library
        IQKeyboardManager.initialize()
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false // remove toolbar ot keyboard
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        
        let db = Firestore.firestore()
        
        print("This is the path of local persistent data: \(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String). In end of the path is Library/Preferences instead of Document")
        
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


}

