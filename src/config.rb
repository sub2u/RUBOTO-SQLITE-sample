require 'ruboto/util/stack'
require 'fileutils'

SRC_DIR       = 'file:' + $activity.package_manager.getApplicationInfo($package_name, 0).sourceDir + '!/'
DATA_DIR      = $activity.files_dir.path

with_large_stack(:name => 'load active support'){require 'active_support'}
with_large_stack(:name => 'load dependecies'){require 'active_support/dependencies'}

if sdcard = $activity.get_external_files_dir(nil)
  $: << "#{sdcard.path}/scripts"
  ActiveSupport::Dependencies.autoload_paths << "#{sdcard.path}/scripts"
end

$: << SRC_DIR
ActiveSupport::Dependencies.autoload_paths << SRC_DIR
with_large_stack{require 'database'}
with_large_stack{require 'migrate'}