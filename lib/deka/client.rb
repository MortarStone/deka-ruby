require "#{File.dirname(__FILE__)}/auto_load"

module Deka
  class Client
    include Deka::Endpoints::Families
    include Deka::Endpoints::Organizations
    include Deka::Endpoints::Transactions
    include Deka::Endpoints::Users

    attr_accessor :organization_uuid, :environment, :default_params

    def initialize(organization_uuid:, environment: :production)
      @organization_uuid = organization_uuid
      @environment = environment
      @default_params = { page: 1, per_page: 100 }
    end

    def base_url
      environment == :development ? 'https://api.thedeka.test' : '?'
    end

    private

    def request(path, params = {})
    end
  end
end
