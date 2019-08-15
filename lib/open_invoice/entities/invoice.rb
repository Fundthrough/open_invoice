module OpenInvoice
  module Entities
    class Invoice < Base
      def index(opts = {})
        request(:get, "/supplier/#{supplier_uuid}/invoices", opts)
      end
    end
  end
end
