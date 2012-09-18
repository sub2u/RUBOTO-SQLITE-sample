MIGRATION_PATH = File.expand_path("#{SRC_DIR}/migrate/")
puts "Looking for migration scripts in #{MIGRATION_PATH}"
migrator = ActiveRecord::Migrator.new(:up, MIGRATION_PATH)
if migrator.pending_migrations.size > 0
  puts "Found #{migrator.pending_migrations.size} migrations."
  migrator.migrate
end