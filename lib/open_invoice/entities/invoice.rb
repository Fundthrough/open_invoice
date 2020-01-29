module OpenInvoice
  module Entities
    class Invoice < Base

      def index(opts = {})
        request(:get, "/supplier/#{supplier_uuid}/invoices/page", opts)
      end

      def attachments(invoice_id, opts = {})
        request(:get, "/supplier/#{supplier_uuid}/invoices/#{invoice_id}/attachments", opts)
      end

      def download_attachment(invoice_id, attachment_id, file_path, opts)
        attachment_url = "/supplier/#{@supplier_uuid}/invoices/#{invoice_id}/attachments/#{attachment_id}"
        dirname = File.dirname(file_path)
        opts.merge!({ :stream_body => true })
        FileUtils.mkdir_p(dirname) unless File.directory?(dirname)
        File.delete(file_path) if File.file?(file_path)
        File.open(file_path, "w") do |file|
            file.binmode
            ::OpenInvoice::Http.get( attachment_url, opts) do |fragment|
              file.write(fragment)
            end
        end
    	  return file_path if File.file?(file_path)
        nil
      end
    end
  end
end
