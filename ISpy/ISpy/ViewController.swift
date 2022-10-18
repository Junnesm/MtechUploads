//
//  ViewController.swift
//  ISpy
//
//  Created by Junne Murdock on 10/17/22.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageISpy: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        imageISpy.image = UIImage(named: "iSpyPhoto")
        
        
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageISpy
    }
    

    func updateZoomFor(size:CGSize) {
        let widthScale = size.width / imageISpy.bounds.width
              let heightScale = size.height / imageISpy.bounds.height
              let scale = min(widthScale, heightScale)
              scrollView.minimumZoomScale = scale
              scrollView.zoomScale = scale
            }
    override func viewDidAppear(_ animated: Bool) {
        updateZoomFor(size: view.bounds.size)
    }
        
    }



