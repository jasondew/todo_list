# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_todo_list_session',
  :secret      => '4fc4f87ae4fca9850207122bab4bcae7d2e1957b2dd9f13da1402db3980d3493dfe1f9c96594cd11fda725a32c088eff137f7d8a32eae774efffb2d2c776c98a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
