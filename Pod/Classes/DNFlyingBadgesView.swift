//
//  DNFlyingBadgesView.swift
//  DNFlyingBadges
//
//  Created by David Norman on 6/4/15.
//  Copyright (c) 2015 David Norman. All rights reserved.
//

import UIKit
import Foundation

public class DNFlyingBadgesView: UIView {
    
    lazy var offscreenTop : Float = {
        [unowned self] in
        var height = Float(self.superview!.frame.height)
        height += Float(self.frame.height)
        
        return height
        }()
    
    public var color : UIColor?
    public var image : UIImage?
    public var defaultImageName : Image?
    
   public enum Image : String {
        case Like = "like"
        case Evil = "evil"
        case Hipster = "hipster"
        case Home = "home3"
        case Loop = "loop2"
        case Mail = "mail2"
        case Pacman = "pacman"
        case Smile = "smile"
        case Spinner = "spinner9"
        case User = "user"
        case Volume = "volume-high"
        case Mute = "valume-mute2"
    }
    
    
// MARK: Initialization

   public init() {
        super.init(frame: CGRectMake(0, 0, 70, 70))
        self.backgroundColor = UIColor.clearColor()
        self.layoutIfNeeded()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
        self.layoutIfNeeded()
    }
    
    public init(frame: CGRect, imageName: Image) {
        super.init(frame: frame)
        self.defaultImageName = imageName
        self.backgroundColor = UIColor.clearColor()
        self.layoutIfNeeded()
    }

    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override func drawRect(rect: CGRect) {
        
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()

        //// Color Declarations
        let bgColor = self.color ?? UIColor(red: 0.322, green: 0.808, blue: 0.329, alpha: 1)
        
        var mainImage : UIImage?
        
        if let defaultImage = self.image {
            mainImage = defaultImage
        } else {
            if let userImageName = defaultImageName {
                var bundle = NSBundle(forClass: self.dynamicType)
                var path = bundle.pathForResource("DNFlyingBadges.bundle/\(userImageName.rawValue)", ofType: ".png")
                var data = NSData(contentsOfFile: path!)
                mainImage = UIImage(contentsOfFile: path!)
                
            } else {
                var bundle = NSBundle(forClass: self.dynamicType)
                var path = bundle.pathForResource("DNFlyingBadges.bundle/like", ofType: ".png")
                var data = NSData(contentsOfFile: path!)
                mainImage = UIImage(contentsOfFile: path!)
                
            }
        }

        //// Oval Drawing
        var ovalPath = UIBezierPath(ovalInRect: CGRectMake(0, 0, self.frame.size.width, self.frame.size.height))
        bgColor.setFill()
        ovalPath.fill()

        //// Oval 2 Drawing
        var oval2Path = UIBezierPath(ovalInRect: CGRectMake(0, 0, self.frame.size.width, self.frame.size.height))
        CGContextSaveGState(context)
        oval2Path.addClip()
        
        // Multiply by 1.2 to make sure the image stays inside the badge circle
        var hfactor = (mainImage!.size.width * 1.3) / self.frame.size.width;
        var vfactor = (mainImage!.size.height * 1.3) / self.frame.size.height;
        
        var factor = fmax(hfactor, vfactor);
        
        // Divide the size by the greater of the vertical or horizontal shrinkage factor
        var newWidth = mainImage!.size.width / factor;
        var newHeight = mainImage!.size.height / factor;
        
        var leftOffset = (self.frame.size.width - newWidth) / 2;
        var topOffset = (self.frame.size.height - newHeight) / 2;
        
        var newRect = CGRectMake(leftOffset,topOffset, (newWidth), (newHeight));
        
        mainImage!.drawInRect(newRect)
            
        CGContextRestoreGState(context)
        
    }
    
//MARK: Actions
    
    public func animateFlyingBadgeFromBottomInView(view: UIView, toPoint: CGPoint, forTime: NSTimeInterval, completion:()->()) {
        
        self.center = CGPointMake(toPoint.x, toPoint.y)
        view.addSubview(self)
        
        var translate = translationAnimation(flyFrom: DNFlyingBadgesView.FlyFrom.Bottom)
        self.layer.addAnimation(translate, forKey: translate.keyPath)
        self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
        
        var scale = scaleAnimation()
        self.layer .addAnimation(scale, forKey: scale.keyPath)
        self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
        
        startRemovalTimer(forTime)

    }
    
    public func animateFlyingBadgeFromTopInView(view: UIView, toPoint: CGPoint, forTime: NSTimeInterval, completion:()->()) {
        
        self.center = CGPointMake(toPoint.x, toPoint.y)
        view.addSubview(self)
        
        var translate = translationAnimation(flyFrom: DNFlyingBadgesView.FlyFrom.Top)
        self.layer.addAnimation(translate, forKey: translate.keyPath)
        self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)

        var scale = scaleAnimation()
        self.layer .addAnimation(scale, forKey: scale.keyPath)
        self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
        
        startRemovalTimer(forTime)
    }
    
    public func rotateAndAnimateFlyingBadgeFromTopInView(view: UIView, toPoint: CGPoint, rotation userDefinedRotation: Double?, continuousRotation: Bool, forTime: NSTimeInterval, completion:()->()) {
        
        self.center = CGPointMake(toPoint.x, toPoint.y)
        view.addSubview(self)
        
        self.center = CGPointMake(toPoint.x, toPoint.y)
        view.addSubview(self)
        
        var translate = translationAnimation(flyFrom: DNFlyingBadgesView.FlyFrom.Top)
        self.layer.addAnimation(translate, forKey: translate.keyPath)
        self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
        
        var scale = scaleAnimation()
        self.layer .addAnimation(scale, forKey: scale.keyPath)
        self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
        
        if let rotationVal = userDefinedRotation {
            var rotation = rotateAnimaton(rotation: rotationVal, continuous: continuousRotation, forTime: forTime, completion:completion)
            self.layer.addAnimation(rotation, forKey: rotation.keyPath)
        }
        
        CATransaction.commit()
        
        startRemovalTimer(forTime)
        
    }
    
    public func rotateAndAnimateFlyingBadgeFromBottomInView(view: UIView, toPoint: CGPoint, rotation userDefinedRotation: Double, continuousRotation: Bool, forTime: NSTimeInterval, completion:()->()) {
        
        self.center = CGPointMake(toPoint.x, toPoint.y)
        view.addSubview(self)
        
        self.center = CGPointMake(toPoint.x, toPoint.y)
        view.addSubview(self)
        
        var translate = translationAnimation(flyFrom: DNFlyingBadgesView.FlyFrom.Bottom)
        self.layer.addAnimation(translate, forKey: translate.keyPath)
        self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
        
        var scale = scaleAnimation()
        self.layer .addAnimation(scale, forKey: scale.keyPath)
        self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
        
        var rotation = rotateAnimaton(rotation: userDefinedRotation, continuous: continuousRotation, forTime: forTime, completion:completion)
        self.layer.addAnimation(rotation, forKey: rotation.keyPath)
        
        CATransaction.commit()
        
        
        startRemovalTimer(forTime)
        
    }
    
    
    
// MARK: Removal Actions
    
   func startRemovalTimer(time : NSTimeInterval) {
        var timer = NSTimer.scheduledTimerWithTimeInterval(time, target: self, selector: "removeBadge", userInfo: nil, repeats: false)
    }
    
   func removeBadge() {
        self.removeFromSuperview()
    }

}

