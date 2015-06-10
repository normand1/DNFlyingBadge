//
//  DNFlyingBadgesTests.swift
//  DNFlyingBadges
//
//  Created by David Norman on 6/10/15.
//  Copyright (c) 2015 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import DNFlyingBadges

class DNFlyingBadgesSpec : QuickSpec {
    
    override func spec() {
        
        describe("a default flying badge view", { () -> Void in
            
            var flyingBadge = DNFlyingBadgesView()
            
            beforeEach({ () -> () in
                flyingBadge = DNFlyingBadgesView()
            })
            
            it("is 70 x 70 with an origin at 0,0") {
                expect(flyingBadge.frame) == CGRectMake(0, 0, 70, 70)
            }
            
            it("can load images from the bundle") {
                var path = NSBundle(forClass: flyingBadge.dynamicType).pathForResource("like", ofType: ".png")
                var data = NSData(contentsOfFile: path!)
               var mainImage = UIImage(contentsOfFile: path!)
                expect(mainImage).notTo(beNil())
            }
        })
    }
    
    
}