Pod::Spec.new do |s|
  s.name         = "CommandBus"
  s.version      = "0.0.1"
  s.summary      = "CommandBus is a light weight Command Bus implementation written in Swift"

  s.description  = "CommandBus is a light weight Command Bus implementation written in Swift. You can use it in order to facilitate your Command pattern implementation. It's also recommanded to use this pattern in a Domain Driven Design achitecture."

  s.homepage     = "https://github.com/Ekhoo/CommandBus"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Lucas Ortis" => "me@lucas-ortis.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/Ekhoo/CommandBus.git", :tag => s.version.to_s }
  s.source_files = "Source/*.swift"
  s.requires_arc = true
  s.dependency   "SwiftyJSON", "~> 2.3.0"
end
