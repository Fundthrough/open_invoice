require "httparty"

module OpenInvoice
  class Http
    include HTTParty

    base_uri OpenInvoice.configs.base_uri
    headers "Content-Type" => "application/json"
    headers "Accept" => "application/json"
    headers "X-API-KEY" => OpenInvoice.configs.api_token
    debug_output $stdout if OpenInvoice.configs.verbose

    class << self
      def request(method, endpoint, opts = {})
        request_opts = normalize_request_options(opts)

        response = send(method, endpoint, request_opts)

        puts "#{method}: #{endpoint}"

        raise ::OpenInvoice::ApiServerError, response.body if server_error?(response)

        Hashie::Mash.new(
          success?:    response.success?,
          status_code: response.code,
          body:        parse_json(response.body),
          headers:     response.headers
        )
      end

      def normalize_request_options(opts)
        opts.clone.tap do |o|
          o[:headers] = default_headers.merge(o[:headers].to_h)
          o[:body]    = jsonify(o[:body]) if o[:body].present?
          o[:query]   = camelcase_keys(o[:query]) if o[:query].present?
        end
      end

      def parse_json(body)
        result = JSON.parse(body.to_s).deep_transform_keys!(&:underscore)
        Hashie::Mash.new(result)
      rescue JSON::ParserError
        body
      end

      def jsonify(body)
        camelcase_keys(body).to_json
      end

      def camelcase_keys(hash)
        hash.deep_transform_keys! { |k| k.to_s.camelcase(:lower) }
      end

      def server_error?(response)
        response.code != 200
      end

      def default_headers
        {}
      end
    end
  end
end
