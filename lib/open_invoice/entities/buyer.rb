module OpenInvoice
  module Entities
    class Buyer < Base
      def index(opts = {})
        request(:get, "/#{OpenInvoice::Configure::VERSION_2}/supplier/#{supplier_uuid}/buyers", opts)
      end
    end
  end
end
