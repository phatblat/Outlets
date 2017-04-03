#
# Rakefile
# Outlets
#

def run(command)
  system(command) or raise "RAKE TASK FAILED: #{command}"
end

namespace "ci" do
  desc "Builds the Outlets framework using Carthage"
  task :carthage do |t|
    run "carthage build --no-skip-current --verbose"
  end

  desc "Builds and tests the OutletsExample project using xcodebuild"
  task :xcodebuild do |t|
    run "set -o pipefail && xcodebuild test -workspace Example/OutletsExample.xcworkspace -scheme OutletsExample -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 6s,OS=latest' ONLY_ACTIVE_ARCH=NO | xcpretty"
  end

  desc "Lints the CocoaPod"
  task :podlint do |t|
    run "bundle exec pod lib lint"
  end
end
