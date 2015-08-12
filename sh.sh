#!/usr/bin/env bash
gem uninstall textmagic-ruby
gem build textmagic-ruby.gemspec
gem install ./textmagic-ruby-0.1.0.gem

ruby examples/bulk_examples.rb
ruby examples/chat_examples.rb
ruby examples/contact_examples.rb
ruby examples/custom_field_examples.rb
ruby examples/invoice_examples.rb
ruby examples/list_examples.rb
ruby examples/message_examples.rb
ruby examples/number_examples.rb
ruby examples/reply_examples.rb
ruby examples/schedule_examples.rb
ruby examples/senderid_examples.rb
ruby examples/session_examples.rb
ruby examples/subaccount_examples.rb
ruby examples/template_examples.rb
ruby examples/unsubscriber_examples.rb
ruby examples/user_examples.rb