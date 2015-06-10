//
//  AnimationsCalculator.swift
//  DNFlyingBadges
//
//  Created by David Norman on 6/5/15.
//  Copyright (c) 2015 David Norman. All rights reserved.
//

import Foundation

extension DNFlyingBadgesView {
    
    enum FlyFrom {
        case Top
        case Bottom
        case Left
        case Right
    }
    

    
    func translationAnimation(#flyFrom : FlyFrom) -> JNWSpringAnimation {
        
        var fromTopOrBottom : Float? = {
            if flyFrom == FlyFrom.Top {
                return -self.offscreenTop
            } else if flyFrom == FlyFrom.Bottom {
                return self.offscreenTop
            } else {
                NSException(name: "only from top or bottom", reason: "only from top or bottom", userInfo: nil)
               return nil
            }
        }()
                
        // Animate the position from the starting Y position of 600 back up to 0
        // which puts it back at the original position
        
        var translate = JNWSpringAnimation(keyPath: "transform.translation.y")
        translate.damping = 15
        translate.stiffness = 15
        translate.mass = 1
        translate.fromValue = fromTopOrBottom
        translate.toValue = 0
        
        return translate
        
    }
    
    func scaleAnimation() -> JNWSpringAnimation {
        var scale = JNWSpringAnimation(keyPath: "transform.scale")
        scale.damping = 32
        scale.stiffness = 450
        scale.mass = 2.4
        scale.fromValue = 0
        scale.toValue = 1.0
        
        return scale
    }
    
    func rotateAnimaton(#rotation : Double, continuous: Bool, forTime: NSTimeInterval, completion:()->()) -> CABasicAnimation {
        
        if continuous {
            
            var rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
            rotationAnimation.toValue = rotation * forTime
            rotationAnimation.duration = forTime
            rotationAnimation.cumulative = true
            rotationAnimation.repeatCount = Float(forTime)
            
            return rotationAnimation
            
        } else {
            
            CATransaction.begin()
            var rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
            rotationAnimation.fromValue = 0
//MARK: Rotate image layer is removed after animation finishes to show un-rotated layer beneath. Fix this so the either the rotated image is not removed or so that the the underlying layer is rotated as well (or instead)
            rotationAnimation.duration = forTime
            rotationAnimation.additive = true;
            rotationAnimation.removedOnCompletion = false
            rotationAnimation.toValue = rotation
            rotationAnimation.cumulative = false
            
            CATransaction.setCompletionBlock({ () -> Void in
                completion()
            })

            return rotationAnimation
        }
    }
}