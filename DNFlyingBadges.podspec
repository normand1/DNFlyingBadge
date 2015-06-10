#
# Be sure to run `pod lib lint DNFlyingBadges.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "DNFlyingBadges"
  s.version          = "0.1.0"
  s.summary          = "DNFlyingBadges is an easy to use and fun control for quick contextual user notification."
  s.description      = <<-DESC
                       DNFlyingBadges is an easy to use and fun control for quick contextual user notification. Rather than the traditional loading or alert that often covers the view and requires user interaction DNFlyingBadges are quick and contextually relevant indicators that can be customized for a variety of situations using a single library.
                       DESC
  s.homepage         = "https://github.com/normand1/DNFlyingBadge"
  s.screenshots     = "https://camo.githubusercontent.com/ea8eaff9da75a9366dab82742aed87e49d1df4c3/687474703a2f2f672e7265636f726469742e636f2f445774616139706733422e676966", "https://camo.githubusercontent.com/ab81e407ef277fdc495fa125378ed5529568c450/687474703a2f2f672e7265636f726469742e636f2f6d484e56454d34776f372e676966"
  s.license          = 'MIT'
  s.author           = { "David Norman" => "david.norman.w@gmail.com" }
  s.source           = { :git => "https://github.com/normand1/DNFlyingBadge.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/1davidnorman'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundle = {
    'DNFlyingBadges' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
