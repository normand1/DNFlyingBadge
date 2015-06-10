//
//  TableViewController.swift
//  SwiftFrameworkTestApp
//
//  Created by David Norman on 6/5/15.
//  Copyright (c) 2015 David Norman. All rights reserved.
//

import UIKit
import DNFlyingBadges

class TableViewController: UITableViewController {
    
    var cellsDataArray = [(String, Int)]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for var index = 0; index < 5; ++index {
            cellsDataArray.append(("Like", index))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return cellsDataArray.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cell = tableView.cellForRowAtIndexPath(indexPath)
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel!.text = "\(cellsDataArray[indexPath.row])"

        return cell
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        
        let likeClosure = {(action: UITableViewRowAction!, indexPath: NSIndexPath! ) -> Void in
            self.cellsDataArray[indexPath.row].0 = "Dislike"
            var flyingBadgeView = DNFlyingBadgesView(frame: CGRectMake(0, 0, 40, 40))
            //            flyingBadgeView.color = UIColor.redColor()
            flyingBadgeView.defaultImageName = DNFlyingBadgesView.Image.Like
            let cell = self.tableView.cellForRowAtIndexPath(indexPath)
            flyingBadgeView.rotateAndAnimateFlyingBadgeFromBottomInView(self.view, toPoint: CGPointMake(cell!.center.x, cell!.center.y), rotation: 0, continuousRotation: false, forTime:1) {
                //animation finished
                self.tableView.reloadData()
            }
        }
        
        let dislikeClosure = {(action: UITableViewRowAction!, indexPath: NSIndexPath! ) -> Void in
            self.cellsDataArray[indexPath.row].0 = "Like"
            var flyingBadgeView = DNFlyingBadgesView(frame: CGRectMake(0, 0, 40, 40))
            flyingBadgeView.color = UIColor.redColor()
            flyingBadgeView.defaultImageName = DNFlyingBadgesView.Image.Like
            let cell = self.tableView.cellForRowAtIndexPath(indexPath)
            flyingBadgeView.rotateAndAnimateFlyingBadgeFromBottomInView(self.view, toPoint: CGPointMake(cell!.center.x, cell!.center.y), rotation: M_PI, continuousRotation: false, forTime:1) {
                //animation finished
                self.tableView.reloadData()            }
        }
        
        let likeAction = UITableViewRowAction(style: UITableViewRowActionStyle.Normal, title: "Like", handler: likeClosure)
        let dislikeAction = UITableViewRowAction(style: UITableViewRowActionStyle.Normal, title: "Dislike", handler: dislikeClosure)
        
        if cellsDataArray[indexPath.row].0 == "Like" {
            return [likeAction]
        } else {
            return [dislikeAction]
        }

    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        // Intentionally blank. Required to use UITableViewRowActions
    }

}
