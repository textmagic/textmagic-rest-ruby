module Textmagic
  module REST
    class ListResource
      include Utils

      def initialize(path, client)
        custom_names = {
            'Replies' => 'Reply'
        }
        @path, @client = path, client
        resource_name = self.class.name.split('::')[-1]
        instance_name = custom_names.fetch(resource_name, resource_name.chop)

        parent_module = self.class.to_s.split('::')[-2]
        full_module_path = if parent_module == 'REST'
                             Textmagic::REST
                           else
                             Textmagic::REST.const_get parent_module
                           end

        @instance_class = full_module_path.const_get instance_name
        @list_key, @instance_id_key = to_underscore_case(resource_name), 'id'
      end

      def list(params={})
        if params.key?('search') or params.key?(:search)
          [:search, 'search'].each do |search|
            params.delete(search)
          end
          path = "#{@path}" << '/search'
        else
          path = "#{@path}"
        end
        response = @client.get path, params
        PaginateResource.new "#{@path}", @client, response, @instance_class
      end

      def get(uid, params={})
        response = @client.get "#{@path}/#{uid}", params
        @instance_class.new "#{@path}", @client, response
      end

      def create(params={})
        response = @client.post "#{@path}", params
        @instance_class.new "#{@path}", @client, response
      end

      def update(uid, params={})
        response = @client.put "#{@path}/#{uid}", params
        @instance_class.new "#{@path}", @client, response
      end

      def delete(uid, params={})
        raise "Can't delete a resource without a REST Client" unless @client
        response = @client.delete "#{@path}/#{uid}", params
      end

    end
  end
end