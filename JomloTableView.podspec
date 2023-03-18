#
# Be sure to run `pod lib lint JomloTableView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JomloTableView'
  s.version          = '1.0.0'
  s.swift_version    = '4.1'
  s.summary          = 'A UITableView with detachable section and row.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
JomloTableView uses detachable section and row. You can add multiple section individually and add rows to each section. See example project for how to use this library.
                       DESC

  s.homepage         = 'https://github.com/setoelkahfi/JomloTableView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Seto Elkahfi' => 'setoelkahfi@gmail.com' }
  s.source           = { :git => 'https://github.com/setoelkahfi/JomloTableView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/setoelkahfi'

  s.ios.deployment_target = '11.0'

  s.source_files = 'JomloTableView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'JomloTableView' => ['JomloTableView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
