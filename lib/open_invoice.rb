require "open_invoice/configure"
require "open_invoice/version"
require "open_invoice/client"
require "active_support/all"

module OpenInvoice
  extend ::OpenInvoice::Configure

  class Error < StandardError; end
  class ApiServerError < Error; end
end
