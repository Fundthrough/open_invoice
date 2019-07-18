require "hashie"
require "open_invoice/entities/base"
require "open_invoice/entities/user"
require "open_invoice/entities/buyer"
require "open_invoice/entities/invoice"
require "open_invoice/entities/supplier"

module OpenInvoice
  class Client
    attr_reader :supplier_uuid, :user_uuid

    def initialize(supplier_uuid:, user_uuid:)
      @user_uuid = user_uuid
      @supplier_uuid = supplier_uuid
    end

    def user
      @user ||= ::OpenInvoice::Entities::User.new(user_uuid)
    end

    def invoice
      @invoice ||= ::OpenInvoice::Entities::Invoice.new(supplier_uuid)
    end
  end
end
