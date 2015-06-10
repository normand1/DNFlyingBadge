//
//  FeelingsViewController.swift
//  DNFlyingBadges
//
//  Created by David Norman on 6/8/15.
//  Copyright (c) 2015 David Norman. All rights reserved.
//

import UIKit
import DNFlyingBadges

class FeelingsViewController: UIViewController {

    @IBOutlet weak var targetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    
    @IBAction func evilAction(sender: UIButton) {
        var flyingBadgeView = DNFlyingBadgesView(frame: CGRectMake(0, 0, 100, 100))
        flyingBadgeView.color = UIColor.redColor()
        flyingBadgeView.defaultImageName = DNFlyingBadgesView.Image.Evil
        flyingBadgeView.rotateAndAnimateFlyingBadgeFromTopInView(self.view, toPoint: targetLabel.frame.origin, rotation: M_PI, continuousRotation: true, forTime:4) {
            //animation finished
        }

    }

    
    
    @IBAction func goodAction(sender: UIButton) {
        var flyingBadgeView = DNFlyingBadgesView(frame: CGRectMake(0, 0, 100, 100))
        flyingBadgeView.color = UIColor.blueColor()
        flyingBadgeView.defaultImageName = DNFlyingBadgesView.Image.Smile
        flyingBadgeView.rotateAndAnimateFlyingBadgeFromTopInView(self.view, toPoint: targetLabel.frame.origin, rotation: M_PI, continuousRotation: true, forTime:4) {
            //animation finished
        }

    }


}
