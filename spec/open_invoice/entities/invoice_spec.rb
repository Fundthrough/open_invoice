require_relative "../../../lib/open_invoice/entities/invoice.rb"

RSpec.describe OpenInvoice::Entities::Invoice do
  let(:subject) { OpenInvoice::Entities::Invoice.new(oi_supplier_uuid) }
  let(:oi_user_uuid) {"a949f990-5c9a-43de-9c9c-f0c6021392d7"}
  let(:oi_supplier_uuid) {"9be120a7-f25e-437e-bf17-533cc43396d2"}
  let(:invoice_id) { 59451733 }
  let(:query_param) do
    {
      query: {
        userUUID: oi_user_uuid
      }
    }
  end

  describe "#history" do
    let(:invoice_history) do
      [
        Hashie::Mash.new({
          action: "Approve",
          actionDate: "2020-02-03T12:31:12-07:00",
          user: "the System"
        }),
        Hashie::Mash.new({
          action: "Submit",
          actionDate: "2020-02-03T12:31:11-07:00",
          user: "Shayan Rahnama",
          comments: "Please approve the invoice which would be used in testing purposes"
        }),
        Hashie::Mash.new({
          action: "Save",
          actionDate: "2020-02-03T12:20:34-07:00",
          user: "Shayan Rahnama"
        })
      ]
    end

    let(:response) do
      Hashie::Mash.new(
        body: Hashie::Mash.new(
          invoice_history: invoice_history,
          invoice_id: invoice_id,
          headers: {},
          success: true,
          success_code: 200
        )
      )
    end

     before do
      allow_any_instance_of(OpenInvoice::Entities::Invoice).to receive(:history).with(invoice_id, query_param).and_return(response)
     end

    it "should get history of invoices" do
      all_history = subject.history(59451733, query_param).body.invoice_history
      expect(all_history).not_to be_nil
      expect(all_history).to match_array(invoice_history)
    end
  end
end
