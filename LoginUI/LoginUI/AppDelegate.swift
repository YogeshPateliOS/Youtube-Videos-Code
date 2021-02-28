//
//  AppDelegate.swift
//  LoginUI
//
//  Created by Yogesh Patel on 12/01/21.
//

import UIKit
import IQKeyboardManagerSwift
import FBSDKCoreKit
import Firebase
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 20
        IQKeyboardManager.shared.enableAutoToolbar = true
        
        ApplicationDelegate.shared.application(
                   application,
                   didFinishLaunchingWithOptions: launchOptions
               )
        FirebaseApp.configure()
        GIDSignIn.sharedInstance()?.clientID = "255115353609-0fe4hb120ffoeh1aplmptdp2dj3lo4mj.apps.googleusercontent.com"
        return true
    }

    func application(
          _ app: UIApplication,
          open url: URL,
          options: [UIApplication.OpenURLOptionsKey : Any] = [:]
      ) -> Bool {
        var flag: Bool = false
          if ApplicationDelegate.shared.application(app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
            annotation: options[UIApplication.OpenURLOptionsKey.annotation]
          ){
            //URL Scheme Facebook
            flag = ApplicationDelegate.shared.application(app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
              annotation: options[UIApplication.OpenURLOptionsKey.annotation]
            )
          }else{
            //URL Scheme Google
            flag = GIDSignIn.sharedInstance().handle(url)
          }
        return flag

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

