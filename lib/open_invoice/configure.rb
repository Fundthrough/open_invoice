# require "open_invoice/configuration"

module OpenInvoice
  module Configure
    KEYS = [:api_token, :base_uri, :verbose].freeze

    attr_writer(*KEYS)

    def configure
      yield self
      self
    end

    def configs
      @configs ||= begin
        hash = {}
        KEYS.each { |key| hash[key] = instance_variable_get(:"@#{key}") }
        Hashie::Mash.new(hash)
      end
    end
  end
end
