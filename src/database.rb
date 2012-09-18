require 'active_record'
require	'android_logger'

ENVIRONMENT = 'production'
DB_DIR = "#{DATA_DIR}/sqlite-#{ENVIRONMENT}"
ActiveRecord::Base.logger = AndroidLogger

connection_options = {
  :adapter => 'jdbcsqlite3',
  :driver   => 'org.sqldroid.SQLDroidDriver',
  :url      => "jdbc:sqldroid:#{DB_DIR}",
  :database => DB_DIR,
  :pool     => 30,
  :timeout => 25000,
}

ActiveRecord::Base.configurations = {
  ENVIRONMENT => connection_options,
}

ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations[ENVIRONMENT])