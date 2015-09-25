module Textmagic
  module REST
    class Replies < ListResource
      ##
      # Get reply by ID.
      # Returns Reply object.
      #
      # uid:: Reply ID. Required.
      #
      # Example:
      #
      #   @reply = client.replies.get 19011
      #
      def get(uid)
        super uid
      end

      ##
      # Get all user replies.
      # Returns PaginateResource object, contains array of Reply objects.
      #
      # The following *params* keys are supported:
      #
      # search::  If *true* then search replies using `ids` and/or `query`. Defaults *false*.
      #
      # page::    Fetch specified results page. Defaults 1
      #
      # limit::   How many results on page. Defaults 10
      #
      # ids::     Find replies by ID(s). Using with `search`=*true*.
      #
      # query::   Find replies by specified search query. Using with `search`=*true*..
      #
      # Example:
      #
      #   @replies = client.replies.list
      #
      def list(params={})
        if params.has_key? :search
          params.delete(:search) unless params[:search]
        end
        super params
      end

      ##
      # Delete reply by ID. Returns *true* if success.
      #
      # uid:: Reply ID. Required.
      #
      # Example:
      #
      #   r = client.replies.delete 28919
      #
      def delete(uid)
        super uid
      end

      ##
      # Creating is not supported
      #
      def create(params)
        raise '`create` method is not supported for this resource'
      end

      ##
      # Updating is not supported
      #
      def update(uid, params)
        raise '`update` method is not supported for this resource'
      end
    end

    ##
    # A Reply resource.
    #
    # ==== @id
    #
    # ==== @sender
    #
    # ==== @message_time
    #
    # ==== @text
    #
    # ==== @receiver
    #
    class Reply < InstanceResource; end
  end
end