module Textmagic
  module REST
    class Unsubscribers < ListResource
      ##
      # Get unsubscriber by ID.
      # Returns Unsubscriber object.
      #
      # uid:: Unsubscriber ID. Required.
      #
      # Example:
      #
      #   @unsubscriber = client.unsubscribers.get 987
      #
      def get(uid)
        super uid
      end

      ##
      # Unsubscribe phone from your communication by phone number.
      # Returns Unsubscriber object contains id and link to new Unsubscriber.
      #
      # The following *params* keys are supported:
      #
      # phone:: Phone number you want to unsubscribe. Required.
      #
      # Example:
      #
      #   @unsubscriber = client.unsubscribers.create {:phone => '999920102'}
      #
      def create(params={})
        super params
      end

      ##
      # Get all user unsubscribers.
      # Returns PaginateResource object, contains array of Unsubscriber objects.
      #
      # The following *params* keys are supported:
      #
      # page::    Fetch specified results page. Defaults 1
      #
      # limit::   How many results on page. Defaults 10
      #
      # Example:
      #
      #   @unsubscribers = client.unsubscribers.list
      #
      def list(params={})
        [:search, 'search'].each do |search|
          params.delete search
        end
        super params
      end

      ##
      # Deleting is not supported.
      #
      def delete(uid)
        raise '`delete` method is not available for this type of resource.'
      end

      ##
      # Updating is not supported.
      #
      def update(uid, params={})
        raise '`update` method is not available for this type of resource.'
      end
    end

    ##
    # A Unsubscriber resource.
    #
    # ==== @id
    #
    # ==== @phone
    #
    # ==== @first_name
    #
    # ==== @last_name
    #
    # ==== @unsubscribe_time
    #
    class Unsubscriber < InstanceResource; end
  end
end