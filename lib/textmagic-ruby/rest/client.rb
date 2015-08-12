module Textmagic
  module REST
    class Client
      include Textmagic::REST::Utils

      attr_reader :username, :token, :host

      ##
      # Create a new TextMagic APIv2 REST HTTP client.
      #
      # Example:
      #
      #   @client = Textmagic::REST::Client.new username, token
      #
      # === <tt>username: 'my_textmagic_username'</tt>
      #
      # TextMagic account's username. Can be found here:
      # https://my.textmagic.com/online/account/details
      #
      # === <tt>token: 'my_textmagic_apiv2_token'</tt>
      #
      # TextMagic account's token. Can be found here:
      # https://my.textmagic.com/online/api/rest-api/keys
      #
      # === <tt>host: 'https://api.textmagictesting.com'</tt>
      #
      # The domain to which you'd like the client to make HTTP requests. Useful
      # for testing. Defaults to 'https://rest.textmagic.com'.
      def initialize(username=nil, token=nil, host='https://rest.textmagic.com/api/v2')
        @username = username
        @token = token
        @host = host
        if @username.nil? || @token.nil?
          raise ArgumentError, 'Username and token are required'
        end

        setup_connection
        setup_resources
      end

      HTTP_HEADERS = {
          'Accept' => 'application/json',
          'Accept-Charset' => 'utf-8',
          'Accept-Language' => 'en-us',
          'User-Agent' => "textmagic-ruby.#{Textmagic::REST::VERSION}"
      }

      [:get, :post, :delete, :put].each do |method|
        method_class = Net::HTTP.const_get method.to_s.capitalize
        define_method method do |path, *args|
          params = args[0]
          params = {} if params.empty?
          path = build_full_path(path, params, method) unless args[1]
          HTTP_HEADERS["X-TM-Username"] = @username
          HTTP_HEADERS["X-TM-Key"] = @token
          request = method_class.new(path, HTTP_HEADERS)
          if [:post, :put].include?(method) or
              ([:delete].include?(method) and !params.empty?)
            request.set_form_data(to_camel_case(params, false))
            HTTP_HEADERS['Content-Type'] = 'application/x-www-form-urlencoded'
          end
          make_request(request)
        end
      end

      def ping
        path = 'ping'
        response = self.get "/#{path}", {}
        response[path]
      end

      protected

      def url_encode(hash)
        hash.to_a.map {|p| p.map {|e| CGI.escape e.to_s}.join '='}.join '&'
      end

      def build_full_path(path, params, method)
        path << "?#{url_encode(to_camel_case(params, false))}" if method == :get && !params.empty?
        "#{@host}#{path}"
      end

      def setup_connection
        uri = URI.parse(@host)
        @conn = Net::HTTP.new(uri.host, uri.port)
        setup_ssl
      end

      def setup_ssl
        @conn.use_ssl = true
        @conn.verify_mode = OpenSSL::SSL::VERIFY_PEER
        @conn.ca_file = File.dirname(__FILE__) + '/../../../conf/cacert.pem'
      end

      def make_request(request)

        response = @conn.request request

        if response.kind_of? Net::HTTPServerError
          raise Textmagic::REST::ServerError
        end

        if response.body and !response.body.empty?
          object = MultiJson.load response.body
        elsif response.code == 204.to_s
          object = true
        elsif response.kind_of? Net::HTTPBadRequest
          object = {:message => 'Bad request', :code => 400}
        end

        if response.kind_of? Net::HTTPClientError
          raise Textmagic::REST::RequestError.new object['message'], object['code']
        end
        object
      end

      def setup_resources
        resource self, :messages, :contacts, :lists, :custom_fields, :unsubscribers,
                 :bulks, :chats, :schedules, :sessions, :templates, :invoices, :users,
                 :numbers, :senderids, :subaccounts, :replies
      end
    end
  end
end
