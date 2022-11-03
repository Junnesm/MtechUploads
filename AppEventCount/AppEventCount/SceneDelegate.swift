//
//  SceneDelegate.swift
//  AppEventCount
//
//  Created by Junne Murdock on 10/11/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var firstVC: FirstVC?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        firstVC = window?.rootViewController as? FirstVC
        firstVC?.willConnectToCount += 1
      
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        firstVC?.sceneDidBecomeActiveCount += 1
        firstVC?.updateView()
     
    }

    func sceneWillResignActive(_ scene: UIScene) {
        firstVC?.sceneWillResignActiveCount += 1
      
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        firstVC?.sceneWillEnterForegroundCount += 1
       
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        firstVC?.sceneDidEnterBackgroundCount += 1 
       
    }


}

