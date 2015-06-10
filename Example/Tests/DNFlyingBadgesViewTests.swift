//
//  DNFlyingBadgesViewTests.swift
//  DNFlyingBadges
//
//  Created by David Norman on 6/10/15.
//  Copyright (c) 2015 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import DNFlyingBadges

class DNFlyingBadgesViewSpec : QuickSpec {
    override func spec() {
        var vc : UIViewController!
        vc = UIViewController()
        
        describe("the view") {
            beforeEach {
                // Method #2: Triggers .viewDidLoad(), .viewWillAppear(), and .viewDidAppear() events.
                vc.beginAppearanceTransition(true, animated: false)
                vc.endAppearanceTransition()
            }
            
            var flyingBadge = DNFlyingBadgesView()
            
            it("animates the flying badge to the center of the main view") {
                flyingBadge.animateFlyingBadgeFromBottomInView(vc.view, toPoint: vc.view.center, forTime: 2, completion: { () -> () in
                    
                })
                
                expect(vc.view.subviews).to(contain(flyingBadge))
                
                expect(flyingBadge.center).toEventually(equal(vc.view.center), timeout: 3, pollInterval: 1)
                
            }
            
            it("should be removed from the superview after 2 seconds") {
                expect(vc.view.subviews).toEventuallyNot(contain(flyingBadge), timeout: 3, pollInterval: 1)
            }
        }
    }
}