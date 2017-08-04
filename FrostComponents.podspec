Pod::Spec.new do |s|
  s.name             = 'FrostComponents'
  s.version          = '0.2.0'
  s.summary          = 'Shared UI Components to be used in multiple projects'

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
  
  s.resource_bundles = {
    'FrostComponents' => [
      'FrostComponents/Assets/*.png', 
      'FrostComponents/Resources/**/*.xib'
    ]
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'

  s.subspec 'FRButton' do |frbutton|
    frbutton.name         = 'FRButton'
    frbutton.source_files = 'FrostComponents/Classes/FrostButton/*.swift', 'FrostComponents/Classes/Extras/*.swift'
  end

  s.subspec 'FRAlert' do |fralert|
    fralert.name         = 'FRAlert'
    fralert.source_files = 'FrostComponents/Classes/FrostAlert/*.swift', 'FrostComponents/Classes/FrostButton/*.swift', 'FrostComponents/Classes/Extras/*.swift'
    fralert.resource_bundles = {
      'FRAlert' => ['FrostComponents/Resources/FrostAlert/*.xib']
    }    
  end
end
