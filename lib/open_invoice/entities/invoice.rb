module OpenInvoice
  module Entities
    class Invoice < Base
      def index(opts = {})
        request(:get, "/supplier/#{supplier_uuid}/invoices/page", opts)
      end
    end
  end
end
