Pod::Spec.new do |s|
  s.name         = "JPLogger"
  s.version      = "0.0.1"
  s.homepage     = "https://github.com/pablasso/JPLogger"
  s.summary      = "A remote logger for Objective-C"
  s.author       = { "Juan Pablo Ortiz" => "pablasso@gmail.com" }
  s.source       = { :git => "~/Development/JPLogger", :branch => "master" }
  s.source_files = 'JPLogger'
  s.dependency 'AFNetworking', '~> 1.2.1'
  s.requires_arc = true
  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'
end
