# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
use_frameworks!

def common_pods
  pod 'XCGLogger'
  pod 'RxSwift'
  pod 'RxCocoa'
end

def test_pods
  pod 'Quick'
  pod 'Nimble'
end

target 'MemoryLeakBuster' do
  common_pods
end

target 'MemoryLeakBusterTests' do
  inherit! :search_paths
  common_pods
  test_pods
end

debug_schemes = ['Debug']

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
          if debug_schemes.include? config.name
            config.build_settings['ONLY_ACTIVE_ARCH'] = 'YES'
            config.build_settings['ENABLE_TESTABILITY'] = 'YES'
          end
        end
    end
end
