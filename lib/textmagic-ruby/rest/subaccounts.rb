module Textmagic
  module REST
    class Subaccounts < ListResource

      ##
      # Get subaccount by ID.
      # Returns Subaccount object.
      #
      # uid:: Subaccount ID. Required.
      #
      # Example:
      #
      #   @subaccount = client.subaccounts.get 123131
      #
      def get(uid)
        super uid
      end

      ##
      # Get all user subaccounts.
      # Returns PaginateResource object, contains array of Subaccount objects.
      #
      # The following *params* keys are supported:
      #
      # page::    Fetch specified results page. Defaults 1
      #
      # limit::   How many results on page. Defaults 10
      #
      # Example:
      #
      #   @subaccounts = client.subaccounts.list
      #
      def list(params={})
        [:search, 'search'].each do |search|
          params.delete search
        end
        super params
      end


      ##
      # Invite new subaccount.
      # Returns True if success.
      #
      # The following *params* keys are supported:
      #
      # email:: Subaccount email. Required.
      #
      # role::  Subaccount role: `A` for administrator or `U` for regular user. Required.
      #
      # Example:
      #
      #   @subaccount = client.subaccounts.create {:email => 'sub_email@gmail.com', :role => 'A'}
      #
      def create(params={})
        self.send_invite params
      end

      ##
      # Invite new subaccount. Alias for 'create' method.
      # Returns True if success.
      #
      # The following *params* keys are supported:
      #
      # email:: Subaccount email. Required.
      #
      # role::  Subaccount role: `A` for administrator or `U` for regular user. Required.
      #
      # Example:
      #
      #   @subaccount = client.subaccounts.send_invite {:email => 'sub_email@gmail.com', :role => 'A'}
      #
      def send_invite(params={})
        response = @client.post "#{@path}", params
      end

      ##
      # Updating is not supported.
      #
      def update(uid, params={})
        raise '`update` method is not supported for this resource.'
      end

      ##
      # Close the subaccount. Returns *true* if success.
      #
      # uid:: Subaccount ID. Required.
      #
      # Example:
      #
      #   r = client.subaccounts.delete 123123
      #
      def delete(uid)
        super uid
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
    class Subaccount < InstanceResource; end
  end
end