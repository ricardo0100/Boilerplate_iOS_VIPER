platform :ios, '9.0'
use_frameworks!
inhibit_all_warnings!

target 'Gondola' do
    pod 'MBProgressHUD', '~> 1.0.0'
    pod 'UIColor_Hex_Swift', '~> 3.0.1'
    pod 'NextResponderTextField'
    pod 'Localize-Swift', '~> 1.6'
    pod 'Alamofire', '~> 4.0.0'
    pod 'ObjectMapper', '~> 2.0.0'
    pod 'ObjectMapper+Realm'
    pod 'AlamofireObjectMapper', '~> 4.0.0'
    pod 'ReachabilitySwift', '~> 3'
    pod 'KeychainSwift', '~> 7.0'
    pod 'RealmSwift', '~> 1.1.0'
    pod 'Crashlytics'
    pod 'Fabric'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
