module Deka
  module Endpoints
    module Organizations
      def organization(params = {})
        request("organizations/#{organization_uuid}", params)
      end
    end
  end
end
