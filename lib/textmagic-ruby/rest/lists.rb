module Textmagic
  module REST
    class Lists < ListResource
      ##
      # Get list by ID.
      # Returns List object.
      #
      # uid:: List ID. Required.
      #
      # Example:
      #
      #   @list = client.lists.get 987
      #
      def get(uid)
        super uid
      end

      ##
      # Create new List.
      # Returns List object contains id and link to new List.
      #
      # The following *params* keys are supported:
      #
      # name::    List name. Required.
      #
      # shared::  Should this list be shared with sub-accounts. Can be 1 or 0. Defaults 0
      #
      # Example:
      #
      #   @list = client.lists.create {:name => 'MyList'}
      #
      def create(params={})
        super params
      end

      ##
      # Get all user lists.
      # Returns PaginateResource object, contains array of List objects.
      #
      # The following *params* keys are supported:
      #
      # search::  If *true* then search lists using `ids` and/or `query`. Defaults *false*.
      #
      # page::    Fetch specified results page. Defaults 1
      #
      # limit::   How many results on page. Defaults 10
      #
      # ids::     Find list by ID(s). Using with `search`=*true*.
      #
      # query::   Find list by specified search query. Using with `search`=*true*..
      #
      # Example:
      #
      #   @lists = client.lists.list
      #
      def list(params={})
        super params
      end

      ##
      # Updates the existing List for the given unique id.
      # Returns List object contains id and link to updated List.
      #
      # uid:: List ID. Required.
      #
      # The following *params* keys are supported:
      #
      # name::    List name. Required.
      #
      # shared::  Should this list be shared with sub-accounts. Can be 1 or 0. Defaults 0
      #
      # Example:
      #
      #   @list = client.lists.update 123, {:name => 'Updated List'}
      #
      def update(uid, params={})
        super uid, params
      end

      ##
      # Delete list by ID. Returns *true* if success.
      #
      # uid:: List ID. Required.
      #
      # Example:
      #
      #   r = client.lists.delete 987
      #
      def delete(uid)
        super uid
      end

      ##
      # Fetch user contacts by given list id.
      # An useful synonym for "contacts/search" command with provided "list_id" parameter.
      # Returns PaginateResource object, contains array of Contact objects.
      #
      # uid:: List ID. Required.
      #
      # The following *params* keys are supported:
      #
      # page::    Fetch specified results page. Defaults 1
      #
      # limit::   How many results on page. Defaults 10
      #
      # Example:
      #
      #   @lists = client.lists.contacts 123
      #
      def contacts(uid, params={})
        response = @client.get "#{@path}/#{uid}/contacts", params
        PaginateResource.new "#{@path}", @client, response, Textmagic::REST::Contact
      end

      ##
      # Unassign contacts from the specified list.
      # Returns *true* if success.
      #
      # uid:: List ID. Required.
      #
      # The following *params* keys are supported:
      #
      # contacts:: Contact ID(s), separated by comma.
      #
      # Example:
      #
      #   r = client.lists.delete_contacts 123, {:contacts => '122, 1212, 12122'}
      #
      def delete_contacts(uid, params={})
        response = @client.delete "#{@path}/#{uid}/contacts", params
      end

      ##
      # Assign contacts to the specified list.
      # Returns List object contains id and link to updated List.
      #
      # uid:: List ID. Required.
      #
      # The following *params* keys are supported:
      #
      # contacts:: Contact ID(s), separated by comma.
      #
      # Example:
      #
      #   r = client.lists.put_contacts 123, {:contacts => '122, 1212, 12122'}
      #
      def put_contacts(uid, params={})
        response = @client.put "#{@path}/#{uid}/contacts", params
        @instance_class.new "#{@path}", @client, response
      end
    end

    ##
    # A List resource.
    #
    # ==== @id
    #
    # ==== @name
    #
    # ==== @members_count
    #
    # ==== @shared
    #
    class List < InstanceResource; end
  end
end