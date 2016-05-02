Pod::Spec.new do |s|
  s.name             = 'Outlets'
  s.version          = '0.1.0'
  s.summary          = 'Utility functions for validating IBOutlet and IBAction connections.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Outlets provides a set of functions to make validating that `IBOutlets` are
connected between your Storyboard/XIB file and view controller properties. It
can also validate that `IBAction` methods are connected correctly as well.

For an explanation of the approach and how these assertions work see
[Testing IBOutlets and IBActions With Curried Functions in Swift](http://phatbl.at/2016/04/29/testing-iboutlets-and-ibactions-with-curried-functions-in-swift.html)

The standalone
[OutletActionAssertion](https://github.com/phatblat/OutletActionAssertion)
project demonstrates how they work.
                       DESC

  s.homepage         = 'https://github.com/phatblat/Outlets'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = 'MIT'
  s.author           = { 'Ben Chatelain' => 'ben@octop.ad' }
  s.source           = { :git => 'https://github.com/phatblat/Outlets.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/phatblat'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Outlets/Source/**/*'

  # s.resource_bundles = {
  #   'OutletsPod' => ['OutletsPod/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
