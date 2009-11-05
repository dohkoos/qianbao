# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_qianbao_session',
  :secret      => '016cccc694be13f2df32e81e0314702718240cc0642d19c7eda215e1ba92481d791baa5242fbbef537fa961ca4ea1eacf9c7c03a659be89e5106e900004274c8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
