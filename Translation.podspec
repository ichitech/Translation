Pod::Spec.new do |s|

  s.name         = "Translation"
  s.version      = "1.0"
  s.summary      = "UIKit & UIFoundation"
  s.description  = "UIKit & UIFoundation Category"
  s.homepage     = "https://github.com/ichitech/translation"
  s.screenshots  = "https://github.com/ichitech/translation/master/translation.jpeg"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Harry Tran" => "ngocbinh02@gmail.com" }
  s.platform     = :ios, '8.0'
  s.source       = { :git => "https://github.com/ichitech/translation.git", :tag => s.version.to_s }
  s.weak_frameworks = "UIKit", "Foundation"
  s.vendored_framework = 'Translation.framework'
  s.resource     = 'Translation.framework/Versions/A/Resources/Translation.bundle'
  s.requires_arc = true
  s.dependency 'AFNetworking'
  s.dependency 'PINCache'
  s.source_files = "Translation.framework/Versions/A/Headers/*.h"
  s.public_header_files = 'Translation.framework/Versions/A/Headers/*.h'

end
