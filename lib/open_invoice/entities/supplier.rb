module OpenInvoice
  module Entities
    class Supplier < Base
      def index(opts)
        request(:get, "/suppliers/#{supplier_uuid}", opts)
      end
    end
  end
end
