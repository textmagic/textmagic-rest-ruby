module Textmagic
  module REST
    class Numbers < ListResource
      ##
      # Get number by ID.
      # Returns Number object.
      #
      # uid:: Number ID. Required.
      #
      # Example:
      #
      #   @number = client.numbers.get 1123
      #
      def get(uid)
        super uid
      end

      ##
      # Get all user dedicated numbers.
      # Returns PaginateResource object, contains array of Numbers objects.
      #
      # The following *params* keys are supported:
      #
      # page::    Fetch specified results page. Defaults 1
      #
      # limit::   How many results on page. Defaults 10
      #
      # Example:
      #
      #   @numbers = client.numbers.list
      #
      def list(params={})
        [:search, 'search'].each do |search|
          params.delete search
        end
        super params
      end

      ##
      # Find available dedicated numbers to buy.
      # Returns AvailableNumber object, contains array of available numbers and price.
      #
      # The following *params* keys are supported:
      #
      # country:: Dedicated number country. Required.
      #
      # prefix::  Desired number prefix. Should include country code (i.e. 447 for GB).
      #
      # Example:
      #
      #   @numbers = client.numbers.available {:country => 'US'}
      #
      def available(params={})
        response = @client.get "#{@path}/available", params
        AvailableNumber.new "#{@path}", @client, response
      end

      ##
      # Buy a dedicated number and assign it to the specified account.
      # Returns Number object, contains id and link to a new dedicated Number.
      #
      # The following *params* keys are supported:
      #
      # phone::    Desired dedicated phone number in international E.164 format. Required.
      #
      # country::  Dedicated number country. Required.
      #
      # user_id::  User ID this number will be assigned to. Required.
      #
      # Example:
      #
      #   @number = client.numbers.buy {:phone => '19025555555', :country => 'US', :user_id => 1234}
      #
      def buy(params={})
        self.create params
      end

      ##
      # Updating is not supported
      #
      def update(uid, params={})
        raise '`update` method is not supported for this resource.'
      end

      ##
      # Cancel dedicated number subscription. Returns *true* if success.
      #
      # uid:: Number ID. Required.
      #
      # Example:
      #
      #   r = client.numbers.delete 1290
      #
      def delete(uid)
        super uid
      end
    end

    ##
    # A Number resource.
    #
    # ==== @id
    #
    # ==== @purchased_at
    #
    # ==== @expire_at
    #
    # ==== @phone
    #
    # ==== @status
    #
    # ==== @country
    #
    # Hash like this
    #   {
    #       "id"   => "US",
    #       "name" => "United States",
    #   }
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
    class Number < InstanceResource
      def refresh
        raise '`refresh` method is not supported for this resource.'
      end
    end

    ##
    # An AvailableNumber resource.
    #
    # ==== @numbers
    #
    # ==== @price
    #
    class AvailableNumber < InstanceResource
      def refresh
        raise '`refresh` method is not supported for this resource.'
      end
    end
  end
end
