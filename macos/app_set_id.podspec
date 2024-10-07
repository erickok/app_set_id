Pod::Spec.new do |s|
  s.name             = 'app_set_id'
  s.version          = '1.2.1'
  s.summary          = 'Tiny Flutter plugin to retrieve the Identifier for Vendor (IDfV)'
  s.description      = <<-DESC
A tiny Flutter library to retrieve a vendor-specific privacy-friendly device-unique identifier, also called IDfV or App Set ID.
                       DESC
  s.homepage         = 'https://github.com/erickok/app_set_id'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Eric Kok' => 'eric@2312.nl' }

  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
