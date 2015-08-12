module Textmagic
  module REST
    class Schedules < ListResource
      ##
      # Get Schedule by ID.
      # Returns Schedule object.
      #
      # uid:: Schedule ID. Required.
      #
      # Example:
      #
      #   @scheduled = client.schedules.get 19011
      #
      def get(uid)
        super uid
      end

      ##
      # Get all user scheduled messages.
      # Returns PaginateResource object, contains array of Schedule objects.
      #
      # The following *params* keys are supported:
      #
      # page::    Fetch specified results page. Defaults 1
      #
      # limit::   How many results on page. Defaults 10
      #
      # Example:
      #
      #   @schedules = client.schedules.list
      #
      def list(params={})
        [:search, 'search'].each do |search|
          params.delete search
        end
        super params
      end

      ##
      # Updating is not supported
      #
      def update(uid, params={})
        raise '`update` method is not supported for this resource.'
      end

      ##
      # Delete scheduled message by ID. Returns *true* if success.
      #
      # uid:: Schedule message ID. Required.
      #
      # Example:
      #
      #   r = client.schedules.delete 182981
      #
      def delete(uid)
        super uid
      end

      ##
      # Creating is not supported
      #
      def create(params={})
        raise '`create` method is not supported for this resource.'
      end
    end

    ##
    # A Schedule resource.
    #
    # ==== @id
    #
    # ==== @next_send
    #
    # ==== @rrule
    #
    # ==== @session
    #
    # Hash like this:
    #   {
    #     "id": "34435949",
    #     "startTime": "2015-05-01T21:30:00+0000",
    #     "text": "Happy Birthday, dude!",
    #     "source": "O",
    #     "referenceId": "O_xxx_cb5e100e5a9a3e7f6d1fd97512215282_10580074905542fc46b9f157.39758261",
    #     "price": 0.03,
    #     "numbersCount": 1
    #   }
    #
    class Schedule < InstanceResource; end
  end
end