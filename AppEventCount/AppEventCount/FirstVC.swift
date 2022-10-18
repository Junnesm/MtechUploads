//
// FirstVC.swift
//  AppEventCount
//
//  Created by Junne Murdock on 10/11/22.
//

import UIKit

class FirstVC: UIViewController {
    
  
    
    
    
    @IBOutlet weak var didFinishLaunchingWithOptionsLabel: UILabel!
    var didFinishLaunchingWithOptions = 0

    @IBOutlet weak var configurationForConnectingLabel: UILabel!
    var configurationForConnecting = 0
    
    @IBOutlet weak var willConnectToLabel: UILabel!
    var willConnectTo = 0
    
    @IBOutlet weak var sceneDidBecomeActiveLabel: UILabel!
    var sceneDidBecomeActive = 0
    
    @IBOutlet weak var sceneWillResignActiveLabel: UILabel!
    var sceneWillResignActive = 0
    
    @IBOutlet weak var sceneWillEnterForegroundLabel: UILabel!
    var sceneWillEnterForeground = 0
    
    @IBOutlet weak var sceneDidEnterBackgroundLabel: UILabel!
    var sceneDidEnterBackground = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    
    
    

}

