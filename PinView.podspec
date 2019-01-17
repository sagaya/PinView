#
# Be sure to run `pod lib lint PinView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PinView'
  s.version          = '0.1.0'
  s.summary          = 'A PIN view library for iOS. Use to enter PIN/OTP/password etc.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Provides a widget to enter PIN/OTP/password etc on
                        DESC

  s.homepage         = 'https://github.com/sagaya/PinView'
  s.screenshots     = 'https://github.com/sagaya/BottomDrawer/raw/master/screenshot.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sagaya' => 'shaggy.hafeez@gmail.com' }
  s.source           = { :git => 'https://github.com/sagaya/PinView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/sagaya_hafeez'

  s.ios.deployment_target = '8.0'

  s.source_files = 'PinView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'PinView' => ['PinView/Assets/*.png']
  # }

  s.frameworks = 'UIKit'
end
