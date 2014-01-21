#
# Be sure to run `pod spec lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://docs.cocoapods.org/specification.html
#
Pod::Spec.new do |s|
  s.name         = "WCFastCell"
  s.version      = "0.9"
  s.summary      = "A faster drop-in replacement for UITableViewCell. Seamless integration with nibs"
  s.description  = <<-DESC
                    WCFastCell automatically draws all UILabels and UIImageViews using Core Graphics providing a better performance on older devices.

                    * Markdown format.
                    * Don't worry about the indent, we strip it!
                   DESC
  s.homepage     = "http://github.com/wczekalski/WCFastCell"
  s.license      = 'MIT'
  s.author       = { "Wojtek Czekalski (wczekalski)" => "me@wczekalski.com" }
  s.source       = { :git => "https://github.com/wczekalski/WCFastCell.git", :tag => s.version.to_s }

  s.platform     = :ios, '5.0'
  s.requires_arc = true

  s.source_files = 'Classes'

  s.public_header_files = 'Classes/**/*.h'
  s.frameworks = 'CoreGraphics', 'UIKit', 'Foundation'
end
