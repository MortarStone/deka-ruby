module Deka
  module Endpoints
    module Families
      def families(params = {})
        request("organizations/#{organization_uuid}/families", params: params)
      end

      def user_family(id, params = {})
        request("organizations/#{organization_uuid}/users/#{user_id}/families/#{id}", params: params)
      end
    end
  end
end
