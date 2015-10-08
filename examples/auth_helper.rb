# Helper routine to access TextMagic credentials stored as environment variables (preferred)
# This will prevent you from accidentally committing your credentials to a repo
def tm_credentials
  tm_u, tm_ak = 'TEXTMAGIC_USERNAME', 'TEXTMAGIC_API_KEY'
  username, api_key = ENV[tm_u], ENV[tm_ak]
  unless username and api_key
    raise ArgumentError, "To use the #{__method__} method, you must set the #{tm_u} and #{tm_ak} environment variables."
  end
    return username, api_key
end
