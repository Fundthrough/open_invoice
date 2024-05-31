module OpenInvoice
  module Entities
    class Supplier < Base
      def index(opts = {})
        request(:get, "/#{OpenInvoice::Configure::VERSION_2}/supplier/#{supplier_uuid}", opts)
      end
    end
  end
end
