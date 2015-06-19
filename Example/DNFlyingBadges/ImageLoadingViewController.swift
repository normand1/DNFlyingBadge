//
//  ImageLoadingViewController.swift
//  DNFlyingBadges
//
//  Created by David Norman on 6/8/15.
//  Copyright (c) 2015 David Norman. All rights reserved.
//

import UIKit
import DNFlyingBadges

class ImageLoadingViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var image : UIImage?
    var flyingBadgeView : DNFlyingBadgesView!
    
    override func viewDidAppear(animated: Bool) {
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            
            if self.flyingBadgeView == nil {
                self.flyingBadgeView = DNFlyingBadgesView(frame: CGRectMake(0, 0, 40, 40))
                self.flyingBadgeView.defaultImageName = DNFlyingBadgesView.Image.Loop
                self.flyingBadgeView.rotateAndAnimateFlyingBadgeFromTopInView(self.view, toPoint: self.imageView.center, rotation: M_PI, continuousRotation: true, forTime:100) {
                    println("finished animation")
                }

            }
            
        })
        
        sendRequest { (image) -> () in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.image = image
                self.imageView.image = self.image!
                self.flyingBadgeView.removeFromSuperview()
                
            })
            
        }


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Data Request
    
    func sendRequest(completionHandler: (image:UIImage)->()) {
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        /* Create session, and optionally set a NSURLSessionDelegate. */
        let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        var URL = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/0/06/Yosemite_USA.JPG")
        let request = NSMutableURLRequest(URL: URL!)
        request.HTTPMethod = "GET"
        
        /* Start a new Task */
        let task = session.dataTaskWithRequest(request, completionHandler: { (data : NSData!, response : NSURLResponse!, error : NSError!) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! NSHTTPURLResponse).statusCode
                if let imageData = data {
                    var image = UIImage(data:data!)
                    if let realImage = image {
                        completionHandler(image: realImage)
                        //successful completion
                    }
                    
                }
            }
            else {
                // Failure
            }
        })
        task.resume()
    }


}
