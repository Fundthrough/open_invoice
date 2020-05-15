FactoryBot.define do
  factory :invoice_history, class: Array do
    skip_create
    initialize_with do
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
  end
end
