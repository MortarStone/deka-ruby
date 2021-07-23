module Deka
  module Endpoints
    module Users
      def users(params = {})
        request("organizations/#{organization_uuid}/users", params: params)
      end

      def user(id, params = {})
        request("organizations/#{organization_uuid}/users/#{id}", params: params)
      end
    end
  end
end
