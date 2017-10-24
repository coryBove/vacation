require './launcher'
require './launcherx'

ENV['presentWorkingDir'] = Dir.pwd

def help
  print "
  You must pass in the path to the file to launch.

  Usage: #{__FILE__} target_file
  "
end

if ARGV.empty?
  help
  exit
end

app_map = {
  'html' => 'firefox.exe -new-window',
  'rb' => 'atom',
  'md' => 'atom'
}

launcher = Launcher.new app_map
target = ARGV
launcher.run target[0], target[1]
