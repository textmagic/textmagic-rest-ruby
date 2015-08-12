module Textmagic
  module REST
    class Invoices < ListResource
      ##
      # Get all user invoices.
      # Returns PaginateResource object, contains array of Invoices objects.
      #
      # The following *params* keys are supported:
      #
      # page::    Fetch specified results page. Defaults 1
      #
      # limit::   How many results on page. Defaults 10
      #
      # Example:
      #
      #   @invoices = client.invoices.list
      #
      def list(params={})
        [:search, 'search'].each do |search|
          params.delete search
        end
        super params
      end

      ##
      # Creating is not supported.
      #
      def create(params={})
        raise '`create` method is not supported for this resource.'
      end

      ##
      # Getting is not supported.
      #
      def get(uid)
        raise '`get` method by ID is not supported for this resource.'
      end

      ##
      # Updating is not supported.
      #
      def update(uid, params={})
        raise '`update` method is not supported for this resource.'
      end

      ##
      # Deleting is not supported.
      #
      def delete(uid)
        raise '`delete` method is not supported for this resource.'
      end
    end

    ##
    # An Invoice resource.
    #
    # ==== @id
    #
    # ==== @bundle
    #
    # ==== @currency
    #
    # ==== @vat
    #
    # ==== @payment_method
    #
    class Invoice < InstanceResource
      def refresh
        raise '`refresh` method is not supported for this resource.'
      end
    end
  end
end