module OpenInvoice
  module Entities
    class Supplier < Base
      def index(opts = {})
        request(:get, "/#{@api_version}/supplier/#{supplier_uuid}", opts)
      end
    end
  end
end
