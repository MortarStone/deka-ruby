module Deka
  module Endpoints
    module Users
      def users(params = {})
        request(
          "organizations/#{organization_uuid}/users",
          { 'page[number]': 1, 'page[size]': 100 }.merge(params)
        )
      end

      def user(id, params = {})
        request("organizations/#{organization_uuid}/users/#{id}", params: params)
      end
    end
  end
end
