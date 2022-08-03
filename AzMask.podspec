#
# Be sure to run `pod lib lint AzMask.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AzMask'
  s.version          = '0.4.0'
  s.summary          = 'An input mask based on Regex.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  An input mask based on Regex.
                       DESC

  s.homepage         = 'https://github.com/alyztech/azmask-ios.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alyz Tech' => 'caiomansho@alyz.tech' }
  s.source           = { :git => 'https://github.com/alyztech/azmask-ios.git', :tag => s.version.to_s }


  s.ios.deployment_target = '12.4'
  s.swift_version = '5.0'

  s.source_files = 'AzMask/Sources/**/*'
  
end
