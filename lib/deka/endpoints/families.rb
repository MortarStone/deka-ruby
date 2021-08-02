module Deka
  module Endpoints
    module Families
      def families(params = {})
        request(
          "organizations/#{organization_uuid}/families",
          { 'page[number]': 1, 'page[size]': 100 }.merge(params)
        )
      end

      def user_family(user_id, params = {})
        request(
          "organizations/#{organization_uuid}/users/#{user_id}/families",
          params
        )
      end
    end
  end
end
