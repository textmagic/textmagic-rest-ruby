# Textmagic::Ruby

The Textmagic Ruby API is a convenient and flexible wrapper for the [TextMagic REST API](https://www.textmagic.com/docs/api/).  It provides functionality for
sending, receiving and managing SMS text messages in pure Ruby.  See the [RDoc documentation](http://www.rubydoc.info/github/textmagic/textmagic-rest-ruby) specifically for this gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'textmagic-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install textmagic-ruby

## Usage
```ruby
client = Textmagic::REST::Client.new 'your_text_magic_username', 'your_text_magic_api_key'

# Send a text message
# Any phone number that starts with 999 is a test phone number
# The phones parameter can contain more than one number (comma delimited)
params = {phones: '9991234567,99945678910', text: 'This is a sample text message'}

# This next line creates and sends the message
sent_message = client.messages.create(params)
puts "The sent message id: #{sent_message.id}"
puts "The sent message URL: #{sent_message.href}"
puts ''

# Read messages sent to your Textmagic account
# By default, client.replies.list() fetches the last 10 messages you've received
received_messages = client.replies.list()
if received_messages.resources.length == 0
  puts 'We haven\'t received any SMS messages with our TextMagic account yet'
else
  received_messages.resources.each do |rm|
    puts "The received message text: #{rm.text}"
    puts "The message was sent from: #{rm.sender}"
    puts ''
  end
end
```



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/textmagic-ruby.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

