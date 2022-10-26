#
# Be sure to run `pod lib lint YJToast.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YJToast'
  s.version          = '1.0.0'
  s.summary          = 'A short description of YJToast.'

  s.description      = <<-DESC
                        description
                       DESC

  s.homepage         = 'https://github.com/yijingKing/YJToast'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '1091676312@qq.com' => '1091676312@qq.com' }
  s.source           = { :git => 'https://github.com/yijingKing/YJToast.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'YJToast/Classes/**/*'
  
  # s.resource_bundles = {
  #   'YJToast' => ['YJToast/Assets/*.png']
  # }

    s.dependency 'SnapKit', '~> 5.6'
end
