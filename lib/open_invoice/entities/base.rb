# require "open_invoice/http"

module OpenInvoice
  autoload :Http, "open_invoice/http"

  module Entities
    class Base
      attr_reader :supplier_uuid

      def initialize(supplier_uuid)
        @supplier_uuid = supplier_uuid
      end

      def self.request(*args)
        ::OpenInvoice::Http.request(*args)
      end

      protected

      def request(*args)
        self.class.request(*args)
      end
    end
  end
end
