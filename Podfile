platform :ios, '9.0'
source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/ElParking/PodSpecs.git'

use_frameworks!

def import_pods
  pod 'SFL', :git=>'https://github.com/SeanChenU/SimpleFormatLanguage.git'
  pod 'OBTRequest'
  pod 'DeviceUtil','2.1.3'
  pod 'INTULocationManager','4.3.0'
  pod 'GoogleMaps','2.7.0'
  pod 'MZTimerLabel','0.5.4'
end

target 'Sobrevuelo ISS' do
  import_pods
end

target 'Sobrevuelo ISSTests' do
  import_pods
end

target 'Sobrevuelo ISSUITests' do
  import_pods
end
