module OpenInvoice
  module Entities
    class User < Base
      attr_reader :user_uuid

      def initialize(user_uuid)
        @user_uuid = user_uuid
      end

      def get
        request(:get, "/#{OpenInvoice::Configure::VERSION_2}/users/#{user_uuid}")
      end
    end
  end
end
