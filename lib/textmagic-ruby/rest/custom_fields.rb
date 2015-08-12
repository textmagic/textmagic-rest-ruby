module Textmagic
  module REST
    class CustomFields < ListResource

      ##
      # Get CustomField by ID.
      # Returns CustomField object.
      #
      # uid:: Custom Field ID. Required.
      #
      # Example:
      #
      #   @custom_field = client.custom_fields.get 987
      #
      def get(uid)
        super uid
      end

      ##
      # Create new CustomField.
      # Returns CustomField object contains id and link to new CustomField.
      #
      # The following *params* keys are supported:
      #
      # name::  Name of custom field. Required.
      #
      # Example:
      #
      #   @custom_field = client.custom_fields.create {:name => 'Birthday'}
      #
      def create(params={})
        super params
      end

      ##
      # Get all user custom fields.
      # Returns PaginateResource object, contains array of CustomField objects.
      #
      # The following *params* keys are supported:
      #
      # page::    Fetch specified results page. Defaults 1
      #
      # limit::   How many results on page. Defaults 10
      #
      # Example:
      #
      #   @custom_fields = client.custom_fields.list
      #
      def list(params={})
        [:search, 'search'].each do |search|
          params.delete search
        end
        super params
      end

      ##
      # Updates the existing CustomField for the given unique id.
      # Returns CustomField object contains id and link to updated CustomField.
      #
      # uid:: Custom field ID. Required.
      #
      # The following *params* keys are supported:
      #
      # name:: Name of custom field. Required.
      #
      # Example:
      #
      #   @custom_field = client.custom_fields.update 123, {:name => 'Updated'}
      #
      def update(uid, params={})
        super uid, params
      end

      ##
      # Delete CustomField by ID. Returns *true* if success.
      #
      # uid:: CustomField ID. Required.
      #
      # Example:
      #
      #   r = client.custom_fields.delete 987
      #
      def delete(uid)
        super uid
      end

      ##
      # Updates contact's custom field value.
      # Returns Contact object contains id and link to updated Contact.
      #
      # uid:: Custom field ID. Required.
      #
      # The following *params* keys are supported:
      #
      # contact_id:: The unique id of the Contact to update value. Required.
      #
      # value::      Value of CustomField. Required.
      #
      # Example:
      #
      #   @custom_field = client.custom_fields.update 123, {:name => 'Updated'}
      #
      def update_value(uid, params={})
        response = @client.put("#{@path}/#{uid}/update", params)
        Textmagic::REST::Contact.new @client, @path, response
      end
    end

    ##
    # A Custom Field resource.
    #
    # ==== @id
    #
    # ==== @name
    #
    # ==== @created_at
    #
    class CustomField < InstanceResource; end
  end
end
