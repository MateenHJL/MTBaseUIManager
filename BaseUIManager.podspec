#
# Be sure to run `pod lib lint Mateen.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BaseUIManager'
  s.version          = '1.2.0'
  s.summary          = 'CONTACT IF YOU HAVE ANY ISSUE:13162378587@163.COM'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'the framework can used your project,you just need create UI(View、Cell、CollectionViewCell) whatever it is, the it will be.'

  s.homepage         = 'https://github.com/MateenHJL/MTBaseUIManager.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'MateenHJL' => '13162378587@163.com' }
  s.source           = { :git => 'https://github.com/MateenHJL/MTBaseUIManager.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'BaseUIManager/Classes/**/*.{h,m}'
  
  # s.resource_bundles = {
  #   'Mateen' => ['Mateen/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
#   s.frameworks = 'UIKit',

  s.dependency 'ChameleonFramework'
  s.dependency 'pop'
   
  s.requires_arc = true
   
end
