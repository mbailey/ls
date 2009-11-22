# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ls_session',
  :secret      => '3b8c7e025caad45cafbd3f300c03e77b93892f7abb1add5eecf65981130f18bbc72541e0ff76b91d808fb7a66739a9eb476b5f651241aeeae445ab61249caedb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
