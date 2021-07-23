module Deka
  module Endpoints
    module Transactions
      def transactions(params = {})
        request("organizations/#{organization_uuid}/transactions", params: params)
      end

      def transaction(id, params = {})
        request("organizations/#{organization_uuid}/transactions/#{id}", params: params)
      end

      def user_transactions(user_id, params = {})
        request("organizations/#{organization_uuid}/users/#{user_id}/transactions", params: params)
      end

      def user_transaction(id, params = {})
        request("organizations/#{organization_uuid}/users/#{user_id}/transactions/#{id}", params: params)
      end
    end
  end
end
