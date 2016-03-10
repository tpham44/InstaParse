//
//  AppDelegate.swift
//  codepathinsta
//
//  Created by JP on 3/1/16.
//  Copyright © 2016 tpham44. All rights reserved.
//

import UIKit
import Parse

// add from video suggested

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    // to use let vc = storyboard. must insert the line below
    
    var storyboard = UIStoryboard(name: "Main", bundle: nil)

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        Parse.initializeWithConfiguration(
            ParseClientConfiguration(block: { (configuration:ParseMutableClientConfiguration) -> Void in
                configuration.applicationId = "instagram"
                //do not use slash in clientKey
                configuration.clientKey = "y5mramu;oipr49p.0"
                configuration.server = "https://codepathsta.herokuapp.com/parse"
                //Add your custom domains here then domain: codepathsta.herokuapp.com
                })
        )
        
        //let current_User = PFUser.currentUser()
        
        //if current_User != nil{
        
        if PFUser.currentUser() != nil{
            print("Found User from mongodb")
            
            let vc = storyboard.instantiateViewControllerWithIdentifier("TabCon") as! UITabBarController
            window?.rootViewController = vc
            window?.makeKeyAndVisible()
            
        } else{
            print("User is not found")
            
            // make sure select Tab Bar then set StoryboardID = TabCon
          
            
        }
        
        // Override point for customization after application launch.
        return true
    }
    
    func onlogOut () {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier ("LoginViewController")
        window?.rootViewController = viewController
        
        
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
    
//    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
//        
//        // Code to initialize Parse
//        // (See above section 'Parse `initializeWithConfiguration` vs `setApplicationId`', if you have not already set it up)
//        
//        // check if user is logged in.
//        
//        if PFUser.currentUser() != nil {
//            // if there is a logged in user then load the home view controller
//        }
//        
//        return true
//    }


}

