//
//  ViewController.swift
//  TrafficLight
//
//  Created by Elena Sharipova on 16.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lightViews: [UIView]!
    @IBOutlet var toggleLightButton: UIButton!
    
    var activeColorIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toggleLightButton.layer.cornerRadius = 10
        toggleLightButton.setTitle("Start".uppercased(), for: .normal)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        lightViews.forEach {
            $0.layer.cornerRadius = $0.layer.bounds.width / 2
            $0.clipsToBounds = true
        }
    }
    
    
    @IBAction func toggleLightButtonTapped() {
        toggleLightButton.setTitle("Next".uppercased(), for: .normal)
        
        if activeColorIndex >= 0 {
            lightViews[activeColorIndex].alpha = 0.3
        }
        
        activeColorIndex = (activeColorIndex == lightViews.count - 1)
            ? 0
            : activeColorIndex + 1
        
        lightViews[activeColorIndex].alpha = 1
    }
}

