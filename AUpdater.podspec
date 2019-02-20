#
# Be sure to run `pod lib lint AUpdater.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AUpdater'
  s.version          = '0.1.2'
  s.summary          = '内测自动获取更新插件 ObjC/Swift'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  轻松让App实现自动更新(建议内测使用), 无耦合直接使用
                       DESC

  s.homepage         = 'https://github.com/RogerAbyss/AUpdater'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'abyss' => 'roger_ren@qq.com' }
  s.source           = { :git => 'git@github.com:RogerAbyss/AUpdater.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'AUpdater/Classes/**/*'
  s.public_header_files = 'AUpdater/Classes/**/*.h'
end
