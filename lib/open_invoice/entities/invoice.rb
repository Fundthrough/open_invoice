module OpenInvoice
  module Entities
    class Invoice < Base
      def index(opts)
        request(:get, "/invoices/#{supplier_uuid}", opts)
      end
    end
  end
end
