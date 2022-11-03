//
// FirstVC.swift
//  AppEventCount
//
//  Created by Junne Murdock on 10/11/22.
//

import UIKit

class FirstVC: UIViewController {
 
    @IBOutlet weak var didFinishLaunchingWithOptionsLabel: UILabel!
    @IBOutlet weak var configurationForConnectingLabel: UILabel!
    @IBOutlet weak var willConnectToLabel: UILabel!
    @IBOutlet weak var sceneDidBecomeActiveLabel: UILabel!
    @IBOutlet weak var sceneWillResignActiveLabel: UILabel!
    @IBOutlet weak var sceneWillEnterForegroundLabel: UILabel!
    @IBOutlet weak var sceneDidEnterBackgroundLabel: UILabel!
 
    
          var willConnectToCount = 0
          var sceneDidBecomeActiveCount = 0
          var sceneWillResignActiveCount = 0
          var sceneWillEnterForegroundCount = 0
          var sceneDidEnterBackgroundCount = 0
        
        var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        
    }
    func updateView() {
        didFinishLaunchingWithOptionsLabel.text = "The app has launched \(appDelegate.launchCount) time(s)"
        configurationForConnectingLabel.text = "The app has configured \(appDelegate.configurationForConnectingCount) times"
        willConnectToLabel.text = "The app has connected \(willConnectToCount) time(s)"
        sceneDidBecomeActiveLabel.text = "The app has become active \(sceneWillResignActiveCount) time(s)"
        sceneWillResignActiveLabel.text = "The app has resigned \(sceneWillResignActiveCount) time(s)"
        sceneWillEnterForegroundLabel.text = "The app has entered the foreground \(sceneWillEnterForegroundCount) time(s)"
        sceneDidEnterBackgroundLabel.text = "The app has entered the background \(sceneDidEnterBackgroundCount) time(s)"
      }
    
    
    

}

