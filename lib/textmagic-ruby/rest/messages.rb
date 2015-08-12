module Textmagic
  module REST
    class Messages < ListResource
      ##
      # Get message by ID.
      # Returns Message object.
      #
      # uid:: Message ID. Required.
      #
      # Example:
      #
      #   @message = client.messages.get 987
      #
      def get(uid)
        super uid
      end

      ##
      # Send a new outbound Message or create Scheduled message when provide *sending_time* parameters
      # Returns Message object contains next attributes: 'id', 'href', 'type',
      # 'sessionId', 'bulkId', 'message_id', 'scheduled_id'.
      #
      # The following *params* keys are supported:
      #
      # text::         Message text. Required if template_id is not set.
      #
      # template_id::  Template used instead of message text. Required if text is not set.
      #
      # sending_time:: Message sending time in unix timestamp format. Default is now.
      #                Optional (required with recurrency_rule set).
      # contacts::     Contacts ids, separated by comma, message will be sent to.
      #
      # lists::        Lists ids, separated by comma, message will be sent to.
      #
      # phones::       Phone numbers, separated by comma, message will be sent to.
      #
      # cut_extra::    Should sending method cut extra characters
      #                which not fit supplied parts_count or return 400 Bad request response instead.
      #                Default is false.
      # parts_count::  Maximum message parts count (TextMagic allows sending 1 to 6 message parts).
      #                Default is 6.
      # reference_id:: Custom message reference id which can be used in your application infrastructure.
      #
      # from::         One of allowed Sender ID (phone number or alphanumeric sender ID).
      #
      # rrule::        iCal RRULE parameter to create recurrent scheduled messages.
      #                When used, sending_time is mandatory as start point of sending.
      # dummy::        If 1, just return message pricing. Message will not send.
      #
      # Example:
      #
      #   @message = client.messages.create {:text => 'Hello from Ruby', :phones => '99900000, 99999999'}
      #
      def create(params={})
        super params
      end

      ##
      # Get all user messages.
      # Returns PaginateResource object, contains array of Message objects.
      #
      # The following *params* keys are supported:
      #
      # search::  If *true* then search messages using `query`, `ids` and/or `session_id`. Defaults *false*.
      #
      # page::    Fetch specified results page. Defaults 1
      #
      # limit::   How many results on page. Defaults 10
      #
      # ids::     Find message by ID(s). Using with `search`=*true*.
      #
      # session_id:: Find message by Session ID. Using with `search`=*true*.
      #
      # query::   Find message by specified search query. Using with `search`=*true*..
      #
      # Example:
      #
      #   @messages = client.messages.list
      #
      def list(params={})
        super params
      end

      ##
      # Check pricing for a new outbound message.
      # An useful synonym for "message" command with "dummy" parameters set to *true*.
      #
      # The following *params* keys are supported:
      #
      # text::         Message text. Required if template_id is not set.
      #
      # template_id::  Template used instead of message text. Required if text is not set.
      #
      # sending_time:: Message sending time in unix timestamp format. Default is now.
      #                Optional (required with recurrency_rule set).
      # contacts::     Contacts ids, separated by comma, message will be sent to.
      #
      # lists::        Lists ids, separated by comma, message will be sent to.
      #
      # phones::       Phone numbers, separated by comma, message will be sent to.
      #
      # cut_extra::    Should sending method cut extra characters
      #                which not fit supplied parts_count or return 400 Bad request response instead.
      #                Default is false.
      # parts_count::  Maximum message parts count (TextMagic allows sending 1 to 6 message parts).
      #                Default is 6.
      # reference_id:: Custom message reference id which can be used in your application infrastructure.
      #
      # from::         One of allowed Sender ID (phone number or alphanumeric sender ID).
      #
      # rrule::        iCal RRULE parameter to create recurrent scheduled messages.
      #                When used, sending_time is mandatory as start point of sending.
      # Example:
      #
      #   @message = client.messages.create {:text => 'Hello from Ruby', :phones => '99900000, 99999999'}
      #
      def price(params={})
        response = @client.get "#{@path}/price", params
        @instance_class.new "#{@path}", @client, response
      end

      ##
      # Delete message by ID. Returns *true* if success.
      #
      # uid:: Message ID. Required.
      #
      # Example:
      #
      #   r = client.messages.delete 1110
      #
      def delete(uid)
        super uid
      end
      ##
      # Updating is not supported.
      # 
      def update(uid, params={})
        raise '`update` method is not supported for this resource.'
      end
    end

    ##
    # A Message resource.
    #
    # ==== @id
    #
    # ==== @receiver
    #
    # ==== @message_time
    #
    # ==== @status
    #
    # ==== @text
    #
    # ==== @charset
    #
    # ==== @first_name
    #
    # ==== @last_name
    #
    # ==== @country
    #
    # ==== @sender
    #
    # ==== @price
    #
    # ==== @parts_count
    #
    class Message < InstanceResource; end
  end
end

