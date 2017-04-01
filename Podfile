source 'https://github.com/CocoaPods/Specs.git'
platform :ios, ’10.0’

# Ignore pod warnings
inhibit_all_warnings!
use_frameworks!

def shared_target_pods 
    pod 'AFNetworking'
    pod 'Firebase/Core'
    pod 'Charts'
    pod 'RealmSwift'
end

target :’HackerRankMobile’ do
    shared_target_pods
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end