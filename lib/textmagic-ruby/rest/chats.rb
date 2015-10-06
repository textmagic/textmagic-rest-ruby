module Textmagic
  module REST
    class Chats < ListResource
      ##
      # Get all user chats.
      #
      # The following *params* keys are supported:
      #
      # page::  Fetch specified results page. Defaults 1
      #
      # limit:: How many results on page. Defaults 10
      #
      # Example:
      #
      #   @chats = client.chats.list
      #
      def list(params={})
        [:search, 'search'].each do |search|
          params.delete search
        end
        super params
      end

      ##
      # Fetch messages from chat with specified phone number.
      #
      # phone:: Phone number in E.164 format. Required.
      #
      # The following *params* keys are supported:
      #
      # page::  Fetch specified results page. Defaults 1
      #
      # limit:: How many results on page. Defaults 10
      #
      # Example:
      #
      #   @chat_messages = client.chats.get_by_phone 99990000
      #
      def get_by_phone(phone, params={})
        if phone.nil? or phone.empty?
          raise Textmagic::REST::RequestError.new 'You must specify a valid E.164 phone number.'
        end
        response = @client.get "#{@path}/#{phone}", params
        PaginateResource.new "#{@path}", @client, response, Textmagic::REST::ChatMessage
      end

      ##
      # Creating is not supported.
      #
      def create(params={})
        raise '`create` method is not supported for this resource.'
      end

      ##
      # Getting by ID is not supported. Try get_by_phone instead.
      #
      def get(uid)
        raise '`get` method by ID is not supported for this resource, use `get_by_phone`.'
      end

      ##
      # Updating is not supported.
      #
      def update(uid, params={})
        raise '`update` method is not supported for this resource.'
      end

      ##
      # Deleting is not supported.
      #
      def delete(uid)
        raise '`delete` method is not supported for this resource.'
      end
    end

    ##
    # A Chat resource.
    #
    # ==== @id
    #
    # ==== @phone
    #
    # ==== @contact
    #
    # Hash like this
    #   {
    #       "id": 4329702,
    #       "first_name": "Jonh",
    #       "last_name": "Doe",
    #       "company_name": "",
    #       "phone": "19025555555",
    #       "email": "",
    #       "country": {
    #         "id": "CA",
    #         "name": "Canada"
    #       },
    #       "custom_fields": [
    #         {
    #             "value": "1970-01-01",
    #             "id": 1111,
    #             "name": "Birthday",
    #             "createdAt": "2015-04-10T06:51:02+0000"
    #         }
    #       ]
    #   }
    #
    # ==== @unread
    #
    # ==== @updated_at
    #
    class Chat < InstanceResource
      def refresh
        raise '`refresh` method is not supported for this resource.'
      end
    end

    ##
    # A Chat Message resource.
    #
    # ==== @id
    #
    # ==== @direction
    #
    # ==== @sender
    #
    # ==== @message_time
    #
    # ==== @text
    #
    # ==== @receiver
    #
    # ==== @deleted
    #
    # ==== @user_id
    #
    # ==== @status
    #
    # ==== @total
    #
    # ==== @first_name
    #
    # ==== @last_name
    #
    class ChatMessage < InstanceResource
      def refresh
        raise '`refresh` method is not supported for this resource.'
      end
    end
  end
end