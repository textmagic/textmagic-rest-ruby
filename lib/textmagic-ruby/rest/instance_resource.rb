module Textmagic
  module REST
    class InstanceResource
      include Utils

      def initialize(path, client, params={})
        @path = path
        @client = client
        load_attributes params
      end

      def load_attributes(hash)
        metaclass = class << self; self; end
        hash.each do |k,v|
          attr = to_underscore_case k
          unless ['client', 'updated'].include? attr
            metaclass.send :define_method, attr.to_sym, &lambda {v}
          end
        end
        @updated = !hash.keys.empty?
      end

      def refresh
        load_attributes(@client.get("#{@path}/#{self.id}", {}))
        self
      end
    end
  end
end