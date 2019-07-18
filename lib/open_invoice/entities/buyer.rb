module OpenInvoice
  module Entities
    class Buyer
      def index(opts)
        request(:get, "/buyers/#{supplier_uuid}", opts)
      end
    end
  end
end
