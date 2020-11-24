#
# Be sure to run `pod lib lint WRCalendarView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WRCalendarView'
  s.version          = '1.3'
  s.summary          = 'Calendar Day and Week View for iOS'
  s.description      = 'Calendar Day and Week View for iOS'
  s.homepage         = 'https://github.com/axelline/WRCalendarView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.authors	     = { 'Mobilu' => 'team@mobilu.lu' }
  s.source           = { :git => 'https://github.com/axelline/WRCalendarView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'WRCalendarView/**/*'
  
  s.resource_bundles = {
    'WRCalendarView' => ['WRCalendarView/**/*.{storyboard,xib}']
  }
  s.dependency 'SwiftDate'
end
