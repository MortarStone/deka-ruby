module Deka
  module Endpoints
    module Transactions
      def transactions(params = {})
        request(
          "organizations/#{organization_uuid}/transactions",
          { 'page[number]': 1, 'page[size]': 100 }.merge(params)
        )
      end

      def transaction(id, params = {})
        request("organizations/#{organization_uuid}/transactions/#{id}", params)
      end

      def user_transactions(user_id, params = {})
        request(
          "organizations/#{organization_uuid}/users/#{user_id}/transactions",
          { 'page[number]': 1, 'page[size]': 100 }.merge(params)
        )
      end

      def user_transaction(user_id, id, params = {})
        request("organizations/#{organization_uuid}/users/#{user_id}/transactions/#{id}", params)
      end
    end
  end
end
