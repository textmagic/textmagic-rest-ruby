# Helper script to access TextMagic credentials stored as environment variables (preferred)
# This will prevent you from accidentally committing your credentials to a repo

def tm_credentials
  username, api_key = ENV['TEXTMAGIC_USERNAME'], ENV['TEXTMAGIC_API_KEY']
  return username, api_key if username and api_key
end
