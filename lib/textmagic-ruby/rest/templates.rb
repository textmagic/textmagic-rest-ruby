module Textmagic
  module REST
    class Templates < ListResource
      ##
      # Get template by ID.
      # Returns Template object.
      #
      # uid:: Template ID. Required.
      #
      # Example:
      #
      #   @template = client.templates.get 987
      #
      def get(uid)
        super uid
      end

      ##
      # Create new Template.
      # Returns Template object contains id and link to new Template.
      #
      # The following *params* keys are supported:
      #
      # name::    Template name. Required.
      #
      # content:: Template text. May contain tags inside braces. Required.
      #
      # Example:
      #
      #   @template = client.templates.create {:name => 'MyTemplate'}
      #
      def create(params={})
        super params
      end

      ##
      # Get all user templates.
      # Returns PaginateResource object, contains array of Template objects.
      #
      # The following *params* keys are supported:
      #
      # search::  If *true* then search templates using `name` and/or `content`. Defaults *false*.
      #
      # page::    Fetch specified results page. Defaults 1
      #
      # limit::   How many results on page. Defaults 10
      #
      # name::    Find template by name. Using with `search`=*true*.
      #
      # content:: Find template by content. Using with `search`=*true*..
      #
      # Example:
      #
      #   @templates = client.templates.list
      #
      def list(params={})
        super params
      end

      ##
      # Updates the existing Template for the given unique id.
      # Returns Template object contains id and link to updated Template.
      #
      # uid:: Template ID. Required.
      #
      # The following *params* keys are supported:
      #
      # name::    Template name. Required.
      #
      # content:: Template text. May contain tags inside braces. Required.
      #
      # Example:
      #
      #   @template = client.templates.update 123, {:name => 'Updated Template'}
      #
      def update(uid, params={})
        super uid, params
      end

      ##
      # Delete template by ID. Returns *true* if success.
      #
      # uid:: Template ID. Required.
      #
      # Example:
      #
      #   r = client.templates.delete 987
      #
      def delete(uid)
        super uid
      end
    end

    ##
    # A Template resource.
    #
    # ==== @id
    #
    # ==== @name
    #
    # ==== @content
    #
    # ==== @last_modified
    #
    class Template < InstanceResource; end
  end
end