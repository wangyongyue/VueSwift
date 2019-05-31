

Pod::Spec.new do |spec|

  spec.name         = "VueSwift"
  spec.version      = "1.0.2"
  spec.summary      = "VueSwift "
  spec.homepage     = "https://github.com/wangyongyue/VueSwift"
  spec.license      = "MIT"
  spec.author       = "wangyongyue"
  spec.platform     = :ios, "8.0"
  spec.ios.deployment_target = "8.0"
  spec.swift_version = '4.2'
  spec.source       = { :git => "https://github.com/wangyongyue/VueSwift.git", :tag => "#{spec.version}" }
  spec.source_files = "VueSwift/Resources/**/*.swift"
  spec.requires_arc = true
  
end

