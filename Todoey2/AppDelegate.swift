//
//  AppDelegate.swift
//  Todoey2
//
//  Created by Jiyoung on 13/05/2019.
//  Copyright © 2019 Jiyoung Kim. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        //print(Realm.Configuration.defaultConfiguration.fileURL)
        
        
        do {
            _ = try Realm()
        } catch {
            print("error initialising a new Realm, \(error)")
        }
        
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        print("applicationDidEnterBackground")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {

    }
    
    

}

