# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'SilentMoon' do
   # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # ignore all warnings from all pods
  inhibit_all_warnings!

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
      end
    end
  end

  # Pods for SilentMoon
  pod 'SwiftLint'
  pod 'R.swift'
  pod 'SnapKit'
  pod 'RxSwift'
  pod 'RxCocoa'
end
