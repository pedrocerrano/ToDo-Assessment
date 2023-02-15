//
//  AppDelegate.swift
//  ToDo
//
//  Created by iMac Pro on 2/14/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //MARK: - MOCK DATA
//        let list1 = List(listName: "Grocery Shop", listItems: [Item(itemName: "Buy Egss"), Item(itemName: "Buy Milk"), Item(itemName: "Buy Bread")])
//        let list2 = List(listName: "Make Dinner", listItems: [Item(itemName: "Cook Pizza")])
//        let list3 = List(listName: "Pack for Vatcation")
//        
//        ListController.sharedInstance.lists.append(contentsOf: [list1, list2, list3])
        
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

