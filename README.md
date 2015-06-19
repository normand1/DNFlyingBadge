# DNFlyingBadges

[![Version](https://img.shields.io/cocoapods/v/DNFlyingBadges.svg?style=flat)](http://cocoapods.org/pods/DNFlyingBadges)
[![License](https://img.shields.io/cocoapods/l/DNFlyingBadges.svg?style=flat)](http://cocoapods.org/pods/DNFlyingBadges)
[![Platform](https://img.shields.io/cocoapods/p/DNFlyingBadges.svg?style=flat)](http://cocoapods.org/pods/DNFlyingBadges)

#### version 0.1 (beta)
_This is still beta quality code - feel free to test, create issues, etc. The library doesn't use any private APIs - apps using it should be fine for release on the App Store._

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

DNFlyingBadges is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "DNFlyingBadges"
```

<a name="intro"></a>
Intro
========
DNFlyingBadges is an easy to use and fun control for quick contextual user notification.
Rather than the traditional loading or alert that often covers the view and requires user interaction DNFlyingBadges are quick and contextually relevant indicators that can be customized for a variety of situations using a single library.

<a name="examples"></a>
Examples
========
DNFlyingBadges is built to accomodate many different scernarios. Here are only a few:

To start off you'll want to create a new FlyingBadgeView

<pre lang="swift">
var flyingBadgeView = DNFlyingBadgesView(frame: CGRectMake(0, 0, 40, 40), imageName: DNFlyingBadgesView.Image.Hipster)
</pre>

(Optional) Customize the color if you'd like, the default is green

<pre lang="swift">
flyingBadgeView.color = UIColor.greenColor()
</pre>

Now present the FlyingBadgeView by passing it a view and a point. You can optionally add a single rotation or a continuous spinning rotation

<pre lang="swift">
flyingBadgeView.rotateAndAnimateFlyingBadgeFromTopInView(tap.view!, toPoint: point, rotation: M_PI, continuousRotation: true, forTime:4) {
println("finished animation") //Handy Animation Completion Closure
}
</pre>

![Multiple badges at any point](http://g.recordit.co/DWtaa9pg3B.gif)

As another example you can easily use DNFlyingBadges with multiple cells of a UITableViewController to provide contextual info about each individual cell.



<pre lang="swift">
flyingBadgeView.rotateAndAnimateFlyingBadgeFromBottomInView(self.view, toPoint: CGPointMake(cell!.center.x, cell!.center.y), rotation: M_PI, continuousRotation: false, forTime:1) {
println("animation finished")
self.tableView.reloadData()            }
}
</pre>

![Easy use with Table Cells](http://g.recordit.co/mHNVEM4wo7.gif)

Credit
========

Author: **David Norman**

* [http://www.davidwnorman.com](http://www.davidwnorman.com)
* [https://twitter.com/1davidnorman](https://twitter.com/1davidnorman)

Includes [JNWSpringAnimation](https://github.com/jwilling/JNWSpringAnimation) by [JONATHAN WILLING](https://github.com/jwilling)

Includes free icons from: [icomoon](https://icomoon.io/#home)

## License

DNFlyingBadges is available under the MIT license. See the LICENSE file for more info.
