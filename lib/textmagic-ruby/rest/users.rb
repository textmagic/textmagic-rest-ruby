module Textmagic
  module REST
    class Users < ListResource
      def initialize(path, client)
        super path[0..-2], client
      end

      def get
        response = @client.get "#{@path}", {}
        @instance_class.new "#{@path}", @client, response
      end

      ##
      # Get all available sender settings which could be used in "from" parameter of POST messages method.
      # Returns Source object, contains arrays of allowed sender ids, shared and dedicated numbers.
      #
      # The following *params* keys are supported:
      #
      # country:: Return sender settings available in specified country only. Optional.
      #
      # Example:
      #
      #   @allowed = client.users.sources
      #
      def sources(params={})
        path = '/sources'
        response = @client.get path, params
        Source.new path, @client, response
      end

      ##
      # Return messaging statistics.
      # Returns an array of hashes each contains messaging stats by given period.
      #
      # The following *params* keys are supported:
      #
      # by::     Group results by specified period: `off`, `day`, `month` or `year`. Default is `off`.
      #
      # start::  Start date in unix timestamp format. Default is 7 days ago.
      #
      # end::    End date in unix timestamp format. Default is now.
      #
      # Example:
      #
      #   @msg_stat = client.users.messaging_stat
      #
      def messaging_stat(params={})
        path = '/stats/messaging'
        response = @client.get path, params
      end

      ##
      # Return account spending statistics.
      # Returns a PaginateResource object contains array of SpendingStat objects.
      #
      # The following *params* keys are supported:
      #
      # page::    Fetch specified results page. Defaults 1
      #
      # limit::   How many results on page. Defaults 10
      #
      # start::   Start date in unix timestamp format. Default is 7 days ago.
      #
      # end::     End date in unix timestamp format. Default is now.
      #
      # Example:
      #
      #   @spend_stat = client.users.spending_stat
      #
      def spending_stat(params={})
        path = '/stats/spending'
        response = @client.get path, params
        PaginateResource.new path, @client, response, SpendingStat
      end

      ##
      # Listing is not supported.
      #
      def list(params={})
        raise '`list` method is not supported for this resource.'
      end

      ##
      # Get current user info.
      # Returns *true* if success.
      #
      # The following *params* keys are supported:
      #
      # first_name::  User first name. Required.
      #
      # last_name::   User last name. Required.
      #
      # company::     User company. Required.
      #
      # Example:
      #
      #   r = client.users.update {:first_name => 'Joye', :last_name => 'Tribbiani', :company => 'TextMagic'}
      #
      def update(params={})
        response = @client.put "#{@path}", params
        @instance_class.new "#{@path}", @client, response
      end

      ##
      # Deleting is not supported.
      #
      def delete(uid)
        raise '`delete` method is not supported for this resource.'
      end

      ##
      # Creating is not supporred.
      #
      def create(params={})
        raise '`create` method is not supported for this resource.'
      end
    end

    ##
    # A Subaccount resource.
    #
    # ==== @id
    #
    # ==== @username
    #
    # ==== @first_name
    #
    # ==== @last_name
    #
    # ==== @balance
    #
    # ==== @company
    #
    # ==== @currency
    #
    # Hash like this:
    #   {
    #     "id": "GBP",
    #     "htmlSymbol": "&pound;"
    #   }
    #
    # ==== @timezone
    #
    # Hash like this:
    #   {
    #     "area": "Pacific",
    #     "dst": "0",
    #     "offset": "-39600",
    #     "timezone": "Pacific/Midway"
    #   }
    #
    # ==== @subaccount_type
    #
    class User < InstanceResource
      def refresh
        load_attributes(@client.get("#{@path}", {}))
        self
      end
    end

    ##
    # A Source resource.
    #
    # ==== @dedicated
    #
    # ==== @shared
    #
    # ==== @sender_ids
    #
    class Source < InstanceResource
      def refresh
        raise '`refresh` method is not supported for this resource.'
      end
    end

    ##
    # A SpendingStat resource.
    #
    # ==== @id
    #
    # ==== @user_id
    #
    # ==== @date
    #
    # ==== @balance
    #
    # ==== @delta
    #
    # ==== @type
    #
    # ==== @value
    #
    # ==== @comment
    #
    class SpendingStat < InstanceResource
      def refresh
        raise '`refresh` method is not supported for this resource.'
      end
    end

  end
end
