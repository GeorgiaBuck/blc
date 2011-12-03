ENV['RAILS_ENV'] ||='production'

# Initialize the rails application
Blc::Application.initialize!
config.action_controller.session_store = :active_record_store
rake create_sessions_table
