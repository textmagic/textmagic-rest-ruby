module Textmagic
  module REST
    class Bulks < ListResource
      ##
      # Get bulks session by ID.
      #
      # uid:: Bulk session ID. Required.
      #
      # Example:
      #
      #   @bulks = client.bulks.get 111
      #
      def get(uid)
        super
      end
      ##
      # Get all bulk sending sessions.
      #
      # The following *params* keys are supported:
      #
      # page::  Fetch specified results page. Defaults 1
      #
      # limit:: How many results on page. Defaults 10
      #
      # Example:
      #
      #   @bulks = client.bulks.list
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
    # A Bulk message session resource.
    #
    # ==== @id
    #
    # ==== @status
    #
    # ==== @items_processed
    #
    # ==== @items_total
    #
    # ==== @created_at
    #
    # ==== @text
    #
    # ==== @session
    #
    # Hash like this
    #   {
    #       "id"           => "34435949",
    #       "startTime"    => "2015-05-01T21:30:00+0000",
    #       "text"         => "error",
    #       "source"       => "O",
    #       "referenceId"  => "O_xxx_cb5e100e5a9a3e7f6d1fd97512215282_10580074905542fc46b9f157.39758261",
    #       "price"        =>  0.03,
    #       "numbersCount" => 1
    #    }
    #
    class Bulk < InstanceResource
    end
  end
end