module OpenInvoice
  module Entities
    class Attachment < Base
      
      attr_reader :invoice_id

      def initialize(invoice_id)
        @invoice_id = invoice_id
      end

      def index(opts = {})
        request(:get, "/supplier/#{supplier_uuid}/invoices/#{@invoice_id}/attachments", opts)
      end

      def download(attachment_id, file_path)
        attachment_url = "/supplier/#{@supplier_uuid}/invoices/#{@invoice_id}/attachments/#{attachment_id}"
        File.open(file_path, "w") do |file|
            file.binmode
            request(:get, attachment_url, stream_body: true) do |fragment|
                file.write(fragment)
            end
        end
    	  return file_path
      end
    end
  end
end
