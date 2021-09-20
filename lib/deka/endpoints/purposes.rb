module Deka
  module Endpoints
    # funds
    module Purposes
      def purposes(params = {})
        request(
          "organizations/#{organization_uuid}/purposes",
          { 'page[number]': 1, 'page[size]': 100 }.merge(params)
        )
      end
    end
  end
end
