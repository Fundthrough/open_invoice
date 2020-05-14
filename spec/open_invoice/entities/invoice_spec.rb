require_relative "../../../lib/open_invoice/entities/invoice.rb"
require "byebug"

RSpec.describe OpenInvoice::Entities::Invoice do
  let(:subject) { OpenInvoice::Entities::Invoice.new(oi_supplier_uuid) }
  let(:oi_user_uuid) {"a949f990-5c9a-43de-9c9c-f0c6021392d7"}
  let(:oi_supplier_uuid) {"9be120a7-f25e-437e-bf17-533cc43396d2"}
  

  describe "#history" do
    fixtures :invoice_history
    it "should get history of invoices" do
      history = subject.history(59451733, query: { userUUID: oi_user_uuid })
      byebug
      expect(history).to eql []
    end
  end
end
