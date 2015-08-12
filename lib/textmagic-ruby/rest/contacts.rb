module Textmagic
  module REST
    class Contacts < ListResource
      ##
      # Get contact by ID.
      # Returns Contact object.
      #
      # uid:: Contact ID. Required.
      #
      # Example:
      #
      #   @contact = client.contacts.get 987
      #
      def get(uid)
        super uid
      end

      ##
      # Create new Contact.
      # Returns Contact object contains id and link to new Contact.
      #
      # The following *params* keys are supported:
      #
      # first_name::
      #
      # last_name::
      #
      # phone::         Contact's phone number. Required.
      #
      # email::
      #
      # company_name::
      #
      # country::       2-letter ISO country code.
      #
      # lists::         String of Lists separated by commas to assign contact. Required.
      #
      # Example:
      #
      #   @contact = client.contacts.create {:phone => '9999999', :lists => '123, 456'}
      #
      def create(params={})
        super params
      end

      ##
      # Get all user contacts.
      # Returns PaginateResource object, contains array of Contact objects.
      #
      # The following *params* keys are supported:
      #
      # search::  If *true* then search contacts using `query`, `ids` and/or `group_id`. Defaults *false*.
      #
      # page::    Fetch specified results page. Defaults 1
      #
      # limit::   How many results on page. Defaults 10
      #
      # shared::  Should contacts in shared lists to be included. Defaults 0
      #
      # ids::     Find contact by ID(s). Using with `search`=*true*.
      #
      # list_id:: Find contact by List ID. Using with `search`=*true*.
      #
      # query::   Find contact by specified search query. Using with `search`=*true*..
      #
      # Example:
      #
      #   @contacts = client.contacts.list
      #
      def list(params={})
        super params
      end

      ##
      # Updates the existing Contact for the given unique id.
      # Returns Contact object contains id and link to updated Contact.
      #
      # uid:: Contact ID. Required.
      #
      # The following *params* keys are supported:
      #
      # first_name::
      #
      # last_name::
      #
      # phone::         Contact's phone number. Required.
      #
      # email::
      #
      # company_name::
      #
      # country::       2-letter ISO country code.
      #
      # lists::         String of Lists separated by commas to assign contact. Required.
      #
      # Example:
      #
      #   @contact = client.contacts.update 123, {:phone => '9999999', :lists => '123, 456'}
      #
      def update(uid, params={})
        super uid, params
      end

      ##
      # Delete contact by ID. Returns *true* if success.
      #
      # uid:: Contact ID. Required.
      #
      # Example:
      #
      #   r = client.contacts.delete 987
      #
      def delete(uid)
        super uid
      end

      ##
      # Fetch lists which contact belongs to.
      # Returns PaginateResource object, contains array of List objects.
      #
      # uid:: Contact ID. Required.
      #
      # The following *params* keys are supported:
      #
      # page::  Fetch specified results page. Defaults 1
      #
      # limit:: How many results on page. Defaults 10
      #
      # Example:
      #
      #   @contact = client.contacts.lists 123
      #
      def lists(uid, params={})
        response = @client.get "#{@path}/#{uid}/lists", params
        PaginateResource.new "#{@path}", @client, response, Textmagic::REST::List
      end
    end

    ##
    # A Contact resource.
    #
    # ==== @id
    #
    # ==== @phone
    #
    # ==== @email
    #
    # ==== @first_name
    #
    # ==== @last_name
    #
    # ==== @company_name
    #
    # ==== @country
    #
    # Hash like this
    #   {
    #       "id"   => "US",
    #       "name" => "United States",
    #   }
    #
    # ==== @custom_fields
    #
    # Array of Hashes, each looks like this
    #   {
    #       "value"     => "30",
    #       "id"        => "1044",
    #       "name"      => "Age",
    #       "createdAt" => "2015-04-27T09:29:46+0000",
    #   }
    #
    class Contact < InstanceResource; end
  end
end