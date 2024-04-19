module OpenInvoice
  module Entities
    class Buyer < Base
      def index(opts = {})
        request(:get, "/v1/supplier/#{supplier_uuid}/buyers", opts)
      end
    end
  end
end
