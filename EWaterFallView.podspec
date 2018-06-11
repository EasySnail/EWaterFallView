Pod::Spec.new do |s|
  s.name         = "EWaterFallView"
  s.version      = "0.0.1"
  s.ios.deployment_target = '8.0'
  s.summary      = "waterfall 瀑布流"
  s.homepage     = "https://github.com/EasySnail/EWaterFallView"
  s.license      = "MIT"
  s.author             = { "EasySnail" => "944200885@qq.com" }
  s.source       = { :git => "https://github.com/EasySnail/EWaterFallView.git", :tag => s.version }
  s.source_files  = "EWaterFallView/EWaterFall"
  s.frameworks = "UIKit","Foundation"
  s.requires_arc = true
end

