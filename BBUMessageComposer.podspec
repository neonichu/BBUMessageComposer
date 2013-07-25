Pod::Spec.new do |s|
  s.name         = 'BBUMessageComposer'
  s.version      = '0.0.4'
  s.summary      = 'A look-alike of the iOS 5/6 TWTweetComposeViewController, which can be used to send messages of any kind.'
  s.homepage     = 'https://github.com/neonichu/BBUMessageComposer'
  s.license      = {:type => 'MIT', :file => 'LICENSE'}
  s.authors      = { 'Boris Bügling' => 'http://buegling.com' }
  s.source       = { :git => 'https://github.com/neonichu/BBUMessageComposer.git', :tag => s.version.to_s }
  s.platform     = :ios, '6.1'
  s.public_header_files = 'Code/{BBUAccountSelectorViewController,BBUMessageComposer,BBUMessageComposeViewController,BBUMessagePoster}.h'
  s.source_files = 'Code/*.{h,m}'
  s.resources = 'Resources/*.xib', 'Resources/DETweet*.png'
  s.frameworks = 'UIKit'
  s.requires_arc = true
end
