Pod::Spec.new do |s|
s.name = 'CLLocationService'
s.version = '0.1.1'
s.summary = 'Get current Location'
s.description = <<-DESC
Get current Location with RxSwift
DESC

s.homepage = 'https://github.com/tuanhust2010/LocationService'
s.license = { type: 'MIT', file: 'LICENSE' }
s.authors = { 'Tuan nguyen' => 'tuanhust2010@gmail.com' }

s.ios.deployment_target = '10.0'

s.swift_version = '4.2'
s.source = { git: 'https://github.com/tuanhust2010/LocationService.git', tag: s.version.to_s }
s.source_files = 'LocationService/LocationService/*.swift'

s.dependency 'RxSwift'
s.dependency 'RxCocoa'

end
