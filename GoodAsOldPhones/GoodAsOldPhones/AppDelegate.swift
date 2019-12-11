//
/*******************************************************************************
        
        File name:     AppDelegate.swift
        Author:        Kairon (李凯隆)
        Blog  :        https://coderkllee.github.io
        E-mail:        coderkllee@163.com
        
        Description:
        
        History:
                3/12/2019: File created.
        
********************************************************************************/
    

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 初始化带导航栏的控制器
        let productViewCongtroller = ProductsTableViewController(style: UITableView.Style.grouped)
        productViewCongtroller.title = "Products";
        let productNavigationController = UINavigationController(rootViewController: productViewCongtroller)
        
        let contactViewController = ContactViewController()
        contactViewController.title = "Us"

        let rootTabBarController = UITabBarController();
        rootTabBarController.addChild(productNavigationController)
        rootTabBarController.addChild(contactViewController)
      
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootTabBarController
        window?.makeKeyAndVisible()
        
        return true
    }


}

