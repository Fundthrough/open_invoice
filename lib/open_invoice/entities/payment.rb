module OpenInvoice
  module Entities
    class Payment < Base
      def index(opts = {})
        request(:get, "/v1/supplier/#{supplier_uuid}/payment", opts)
      end
    end
  end
end
