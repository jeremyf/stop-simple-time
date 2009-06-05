# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_stop-simple-time_session',
  :secret      => '5b6aca1deefcb8ff774b78592278a62a15ef0a0104be96045b0185f2a9b2e359e546b100cc3fc1678ef2b7c3cf72df14633934c52d7b1e85a3dc6fcf1d157810'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
