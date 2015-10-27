//
//  AppDelegate.swift
//  3DTouchDemo
//
//  Created by max205 on 2015/10/26.
//  Copyright © 2015年 max205. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //register application shortcutItems
        self.createAppShortcutItems();
        
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
    
    
    //MARK: Application ShortcutItems handler.
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        let page = self.getPage("Main", identifier: "ImageViewController") as! ImageViewController;
        switch(shortcutItem.type) {
            
        case "List":
            if let page = self.getPage("Main", identifier: "ViewController") as? ViewController{
                page.view.backgroundColor = UIColor.blueColor();
                (self.window?.rootViewController as! UINavigationController).pushViewController(page, animated: false);
                return;
            }
            
        default:
            page.imageName = shortcutItem.type;
            break;
            
        }
        
        (self.window?.rootViewController as! UINavigationController).pushViewController(page, animated: false);
        
    }
    
    @available(iOS 9.0, *)
    func createAppShortcutItems(){
        
        let items = [
            UIApplicationShortcutItem(type: "List", localizedTitle: "Image List"),
            UIApplicationShortcutItem(type: "田馥甄", localizedTitle: "田馥甄"),
            UIApplicationShortcutItem(type: "A-Lin", localizedTitle: "A-Lin"),
            UIApplicationShortcutItem(type: "王心凌", localizedTitle: "王心凌"),
            UIApplicationShortcutItem(type: "林依晨", localizedTitle: "林依晨")
            
        ];
        
        UIApplication.sharedApplication().shortcutItems = items;
        
    }
    
    

    func getPage(storyBoard: String, identifier: String) -> AnyObject{
        
        return UIStoryboard(name: storyBoard, bundle: nil).instantiateViewControllerWithIdentifier(identifier);
        
    }
    
}

