#
# Be sure to run `pod lib lint ETUtilities.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ETUtilities'
  s.version          = '2.0'
  s.summary          = 'Coding utilities to easiest everyday hard work.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/EtneteraMobile/ETUtilities'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Etnetera Mobile' => 'mobile@etnetera.cz' }
  s.source           = { :git => 'https://github.com/EtneteraMobile/ETUtilities.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'ETUtilities/Classes/**/*'

  s.frameworks = 'UIKit'
  
end
