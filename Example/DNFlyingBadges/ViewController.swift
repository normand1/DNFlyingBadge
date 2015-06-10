//
//  ViewController.swift
//  FlyingBadgesTestApp
//
//  Created by David Norman on 6/5/15.
//  Copyright (c) 2015 David Norman. All rights reserved.
//

import UIKit
import DNFlyingBadges

class ViewController: UIViewController {
    @IBOutlet weak var centerLabel: UILabel!
    var tapCounter : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var tapGesture = UITapGestureRecognizer(target: self, action: "tapRecognized:")
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func tapRecognized(tap : UITapGestureRecognizer) {
        if(tap.state == UIGestureRecognizerState.Ended) {
            let point = tap.locationInView(tap.view)
            var flyingBadgeView = DNFlyingBadgesView(frame: CGRectMake(0, 0, 40, 40), imageName: DNFlyingBadgesView.Image.Hipster)
            flyingBadgeView.rotateAndAnimateFlyingBadgeFromTopInView(tap.view!, toPoint: point, rotation: M_PI, continuousRotation: true, forTime:4) {
                //finished animation
            }
        }
        
        tapCounter++
        
        if tapCounter > 2 {
            self.centerLabel.text = "Hey When did we get to San Francisco?"
        }
        if tapCounter > 10 {
            self.centerLabel.text = "Ok enough hipsters, go try something else!"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}

