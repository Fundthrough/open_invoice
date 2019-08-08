module OpenInvoice
  module Entities
    class Supplier < Base
      def index(opts = {})
        request(:get, "/supplier/#{supplier_uuid}", opts)
      end
    end
  end
end
