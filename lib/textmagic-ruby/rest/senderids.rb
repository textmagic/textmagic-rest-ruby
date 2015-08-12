module Textmagic
  module REST
    class Senderids < ListResource
      ##
      # Get senderid by ID.
      # Returns Senderid object.
      #
      # uid:: Senderid ID. Required.
      #
      # Example:
      #
      #   @senderid = client.senderids.get 1123
      #
      def get(uid)
        super uid
      end

      ##
      # Create new Senderid.
      # Returns Senderid object contains id and link to new Senderid.
      #
      # The following *params* keys are supported:
      #
      # sender_id::    Alphanumeric Sender ID (maximum 11 characters). Required.
      #
      # explanation::  Explain why do you need this Sender ID. Required.
      #
      # Example:
      #
      #   @senderid = client.senderids.create {:sender_id => 'MYSENDERID', :explanation => 'For Testing'}
      #
      def create(params={})
        super params
      end

      ##
      # Get all user sender ids.
      # Returns PaginateResource object, contains array of Senderid objects.
      #
      # The following *params* keys are supported:
      #
      # page::    Fetch specified results page. Defaults 1
      #
      # limit::   How many results on page. Defaults 10
      #
      # Example:
      #
      #   @senderids = client.senderids.list
      #
      def list(params={})
        [:search, 'search'].each do |search|
          params.delete search
        end
        super params
      end

      ##
      # Updating is not supported.
      #
      def update(uid, params={})
        raise '`update` method is not supported for this resource.'
      end

      ##
      # Delete senderid by ID. Returns *true* if success.
      #
      # uid:: Senderid ID. Required.
      #
      # Example:
      #
      #   r = client.senderids.delete 192881
      #
      def delete(uid)
        super uid
      end
    end

    ##
    # A Senderid resource.
    #
    # ==== @id
    #
    # ==== @sender_id
    #
    # ==== @status
    #
    # ==== @user
    #
    # Hash like this
    #   {
    #     "id": 11111,
    #     "username": "johndoe",
    #     "firstName": "John",
    #     "lastName": "Doe",
    #     "status": "A",
    #     "balance": 13.793,
    #     "company": "TextMagic",
    #     "currency": {
    #     "id": "GBP",
    #     "htmlSymbol": "&pound;"
    #   },
    #     "timezone": {
    #     "id": 2,
    #     "area": "Pacific",
    #     "dst": 0,
    #     "offset": -39600,
    #     "timezone": "Pacific/Midway"
    #   },
    #     "subaccountType": "P"
    #   }
    #
    class Senderid < InstanceResource; end
  end
end