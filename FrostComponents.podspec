#
# Be sure to run `pod lib lint FrostComponents.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FrostComponents'
  s.version          = '0.1.0'
  s.summary          = 'Shared UI Components to be used in multiple projects'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Current pod allows to share common UI components and Utils without need to copy paste them between projects.
                       DESC

  s.homepage         = 'https://github.com/sergii-frost/FrostComponents'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sergii-frost' => 'sergii@frost.se' }
  s.source           = { :git => 'https://github.com/sergii-frost/FrostComponents.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/sergii_mobile'

  s.ios.deployment_target = '9.0'

  s.source_files = 'FrostComponents/Classes/**/*'
  
  # s.resource_bundles = {
  #   'FrostComponents' => ['FrostComponents/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
