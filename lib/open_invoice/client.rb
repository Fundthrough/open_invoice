require "hashie"
require "open_invoice/entities/base"
require "open_invoice/entities/user"
require "open_invoice/entities/buyer"
require "open_invoice/entities/invoice"
require "open_invoice/entities/supplier"

module OpenInvoice
  class Client
    attr_reader :supplier_uuid, :user_uuid

    def initialize(supplier_uuid: nil, user_uuid: nil)
      raise "Please provide a supplier_uuid or user_uuid" if supplier_uuid.nil? && user_uuid.nil?

      @user_uuid = user_uuid
      @supplier_uuid = supplier_uuid
    end

    def user
      @user ||= ::OpenInvoice::Entities::User.new(user_uuid)
    end

    def invoice
      @invoice ||= ::OpenInvoice::Entities::Invoice.new(supplier_uuid)
    end

    def supplier
      @supplier ||= ::OpenInvoice::Entities::Supplier.new(supplier_uuid)
    end

    def buyer
      @buyer ||= ::OpenInvoice::Entities::Buyer.new(supplier_uuid)
    end

    def payment
      @buyer ||= ::OpenInvoice::Entities::Payment.new(supplier_uuid)
    end
  end
end
