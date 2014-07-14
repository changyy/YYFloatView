Pod::Spec.new do |s|
  s.name     = 'YYFloatView'
  s.version  = '1.0'
  s.license  = { :type => 'BSD'}
  s.summary  = 'A Float UIView for iOS.'
  s.homepage = 'https://github.com/changyy/YYFloatView'
  s.authors  = 'Yuan-Yi Chang', 
  s.source   = { :git => 'https://github.com/changyy/YYFloatView.git',
                 :tag => "#{s.version}" }
  s.description = ''
  s.source_files = '{YYFloatView,YYMultipleButtonScrollView}/*.{h,m}'
  s.requires_arc = true
  s.ios.deployment_target = '7.0'
end
