Pod::Spec.new do |s|
  s.name             = 'app_set_id'
  s.version          = '0.1.0'
  s.summary          = 'Tiny Flutter plugin to retrieve the Identifier for Vendor (IDfV)'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'https://github.com/erickok/app_set_id'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Eric Kok' => 'eric@2312.nl' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
