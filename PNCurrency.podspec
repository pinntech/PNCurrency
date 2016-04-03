Pod::Spec.new do |s|
  s.name             = "PNCurrency"
  s.version          = "1.0.2"
  s.summary          = "An easy to use US currency format interchange model"

  s.description      = <<-DESC
    PNCurrency is a US currency class that wraps all the conversions from
    different types and will shorted up any code that deals with US currency.
    The interface is simple, short and easy to get started.
                       DESC

  s.homepage         = "https://github.com/pinnrepo/PNCurrency"
  s.license          = 'MIT'
  s.author           = { "David Westerhoff" => "david@getpinn.co" }
  s.source           = { :git => "https://github.com/pinnrepo/PNCurrency.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
end
