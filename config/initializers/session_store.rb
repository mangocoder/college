# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_college_session',
  :secret      => 'c6735345e6e15a434ec15ffc2fc3a28e2f25ce0b9bbf2d143e834d709a3a8e416a754c8cd9cb91ed72400134894f07057bcd1501831e41019e22cb3d122096a1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
