#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/

Pod::Spec.new do |s|
  s.name         = 'GDPLimitTextView'
  s.version      = '1.0.4'
  s.summary      = 'TextView有占位符合字数限制和提示'
  s.homepage     = 'https://github.com/sunmumu/GDPLimitTextView'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'sunmumu' => '335089101@qq.com' }
  s.platform     = :ios, '9.0'
  s.ios.deployment_target = '9.0'
  s.source       = { :git => 'https://github.com/sunmumu/GDPLimitTextView.git', :tag => s.version.to_s }
  s.requires_arc = true
  s.source_files = 'GDPLimitTextView/**/*.{h,m}'
  s.public_header_files = 'GDPLimitTextView/**/*.{h}'
  
  s.libraries = 'z'
  s.frameworks = 'UIKit'
  s.dependency 'Masonry'
  

end
