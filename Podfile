source 'https://github.com/CocoaPods/Specs.git'
platform :ios, ’10.0’

# Ignore pod warnings
inhibit_all_warnings!
use_frameworks!

def shared_target_pods 
    pod 'AFNetworking'
    pod 'Alamofire', '~> 4.4'
    pod 'Firebase'
    pod 'Firebase/Core'
    pod 'Firebase/Auth'
    pod 'FirebaseUI/Auth'
    pod 'Firebase/Database'
    pod 'Firebase/Storage'
    pod 'Charts'
    pod 'AppAuth'
    pod 'SwiftyJSON'
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
