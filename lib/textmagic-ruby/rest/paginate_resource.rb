module Textmagic
  module REST
    class PaginateResource
      include Utils

      attr_reader :resources, :page, :page_count, :limit
      def initialize(path, client, params={}, resource_class=nil)
        @path = path
        @client = client
        %w(page limit pageCount).each do |attr|
          self.instance_variable_set("@#{to_underscore_case(attr)}", params.fetch(attr))
        end
        @resources = Array.new
        params['resources'].each do |r|
          @resources << resource_class.new(@path, @client, r)
        end if resource_class
      end
    end
  end
end