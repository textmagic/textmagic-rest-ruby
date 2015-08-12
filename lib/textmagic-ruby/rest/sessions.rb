module Textmagic
  module REST
    class Sessions < ListResource

      ##
      # Get all user message sessions.
      # Returns PaginateResource object, contains array of Session objects.
      #
      # The following *params* keys are supported:
      #
      # page::    Fetch specified results page. Defaults 1
      #
      # limit::   How many results on page. Defaults 10
      #
      # Example:
      #
      #   @sessions = client.sessions.list
      #
      def list(params={})
        [:search, 'search'].each do |search|
          params.delete search
        end
        super params
      end

      ##
      # Get session by ID.
      # Returns Session object.
      #
      # uid:: Session ID. Required.
      #
      # Example:
      #
      #   @session = client.sessions.get 123131
      #
      def get(uid)
        super uid
      end

      ##
      # Fetch messages by given session id.
      # An useful synonym for "messages/search" command with provided `session_id` parameter.
      # Returns PaginateResource object, contains array of Message objects.
      #
      # uid:: Session ID. Required.
      #
      # The following *params* keys are supported:
      #
      # page::    Fetch specified results page. Defaults 1
      #
      # limit::   How many results on page. Defaults 10
      #
      # Example:
      #
      #   @messages = client.sessions.messages 123
      #
      def messages(uid, params={})
        response = @client.get "#{@path}/#{uid}/messages", params
        PaginateResource.new "#{@path}", @client, response, Textmagic::REST::Message
      end

      ##
      # Updating is not supported.
      #
      def update(uid, params={})
        raise '`update` method is not supported for this resource.'
      end

      ##
      # Creating is not supported.
      #
      def create(params={})
        raise '`create` method is not supported for this resource.'
      end

      ##
      # Delete session by ID. Returns *true* if success.
      #
      # uid:: Session ID. Required.
      #
      # Example:
      #
      #   r = client.sessions.delete 123123
      #
      def delete(uid)
        super uid
      end
    end

    ##
    # A Session resource.
    #
    # ==== @id
    #
    # ==== @start_time
    #
    # ==== @text
    #
    # ==== @source
    #
    # ==== @reference_id
    #
    # ==== @price
    #
    # ==== @numbers_count
    #
    class Session < InstanceResource; end
  end
end