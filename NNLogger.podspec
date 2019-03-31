Pod::Spec.new do |s|
  s.homepage         = 'https://github.com/ChandlerNguyen/NNLogger'
  s.name             = 'NNLogger'
  s.version          = '0.1.0'
  s.summary          = 'The NNLogger class is a simple wrapper class of the SwiftyBeaver logger library.'
  s.author           = 'Chandler Nguyen'
  s.source           = { :git => 'https://github.com/ChandlerNguyen/NNLogger.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'NNLogger/**/*'
  s.framework  = "Foundation", "UIKit"
  s.requires_arc = true
  s.dependency "SwiftyBeaver"
end
