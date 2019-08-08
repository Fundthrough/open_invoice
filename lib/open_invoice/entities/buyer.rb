module OpenInvoice
  module Entities
    class Buyer < Base
      def index(opts = {})
        # request(:get, "/#{supplier_uuid}/buyers/", opts)
        request(:get, "/buyers/page", opts)
      end
    end
  end
end
