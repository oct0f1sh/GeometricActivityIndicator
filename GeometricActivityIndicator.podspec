#
# Be sure to run `pod lib lint GeometricActivityIndicator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GeometricActivityIndicator'
  s.version          = '0.1.0'
  s.summary          = 'A collection of intricate geometric ActivityIndicator animations that add pizzaz to your projects.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
GeometricActivityIndicator adds UIViews that animate Metatron's Solids. These shapes have a unique shape and are the perfect addition to your projects.
                       DESC

  s.homepage         = 'https://github.com/oct0f1sh/GeometricActivityIndicator'
  s.screenshots      = 'https://i.imgur.com/rcLA8Em.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'oct0f1sh' => 'duncan@duncanmacdonald.us' }
  s.source           = { :git => 'https://github.com/oct0f1sh/GeometricActivityIndicator.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/oct0f1sh'

  s.ios.deployment_target = '8.0'

  s.source_files = 'GeometricActivityIndicator/Classes/**/*'
  
  # s.resource_bundles = {
  #   'GeometricActivityIndicator' => ['GeometricActivityIndicator/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
