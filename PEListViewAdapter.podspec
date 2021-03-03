Pod::Spec.new do |s|
  s.name             = 'PEListViewAdapter'
  s.version          = '1.0.1'
  s.summary          = '使用适配器模式实现的便捷的UICollectionView和UITableView的代理,简化代码,提高代码紧凑性和可读性'

  s.homepage         = 'https://www.jianshu.com/u/50c12381f32c'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kunyu.cai' => 'kunyu.cai@poleera.com' }
  s.source           = { :git => 'https://github.com/githubxixiwa/PEListViewAdapter.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'PEListViewAdapter/Classes/**/*'
  
  # s.resource_bundles = {
  #   'PEListViewAdapter' => ['PEListViewAdapter/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
