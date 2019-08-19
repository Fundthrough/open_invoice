module OpenInvoice
  module Entities
    class Payment < Base
      def index(opts = {})
        request(:get, "/supplier/#{supplier_uuid}/payment", opts)
      end
    end
  end
end
