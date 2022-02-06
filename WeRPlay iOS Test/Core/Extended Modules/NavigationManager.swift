//
//  NavigationManager.swift
//  WeRPlay iOS Test
//
//  Created by Muneeb on 05/02/2022.
//

import UIKit

class NavigationManager : NSObject {
    
    //MARK: - Navigation
    func navigateToLaunch(window: UIWindow) {
        window.makeKeyAndVisible()
        let navController = NavigationController(rootViewController: SplashViewController())
        window.rootViewController = navController
    }
    
    func navigateToHome() {
        var window = UIWindow()
        if #available(iOS 13.0, *) {
            window = Scene_Delegate.window!
        } else {
            window = App_Delegate.window!
        }
        
        window.makeKeyAndVisible()
        
        let navController = NavigationController(rootViewController: HomeViewController())
        navController.navigationBar.prefersLargeTitles = true
        
        window.rootViewController = navController
    }
    
}
