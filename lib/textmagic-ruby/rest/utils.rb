module Textmagic
  module REST
    module Utils

      def to_camel_case(o, capitalize = true)
        return key_map(o, :to_camel_case, capitalize) if o.is_a? Hash
        string = o.to_s
        string = string.split('_').map do |s_part|
          s_part[0,1].capitalize + s_part[1..-1]
        end.join
        unless capitalize
          return string[0,1].downcase + string[1..-1]
        else
          return string
        end
      end

      def to_underscore_case(o, capitalize = false)
        return key_map(o, :to_underscore_case) if o.is_a? Hash
        string = o.to_s
        string = string[0,1].downcase + string[1..-1]
        string.gsub(/[A-Z][a-z]*/) {|s| "_#{s.downcase}"}
      end

      def resource(client, *resources)
        resources.each do |r|
          resource = to_camel_case r
          path = "#{@path}/#{resource}".downcase
          enclosing_module = if @submodule == nil
                               Textmagic::REST
                             else
                               Textmagic::REST.const_get(@submodule)
                             end
          resource_class = enclosing_module.const_get resource
          instance_variable_set("@#{r}", resource_class.new(path, client))
        end
        self.class.instance_eval { attr_reader *resources }
      end

      def key_map(s, method, capitalize = true)
        s = s.to_a.flat_map do |pair|
          [send(method, pair[0], capitalize).to_sym, pair[1]]
        end
        Hash[*s]
      end
    end
  end
end