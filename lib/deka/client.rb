require "#{File.dirname(__FILE__)}/auto_load"

module Deka
  class Client
    include Deka::Endpoints::Families
    include Deka::Endpoints::Organizations
    include Deka::Endpoints::Transactions
    include Deka::Endpoints::Users

    attr_accessor :partner_token, :personal_access_token, :organization_uuid,
      :environment, :default_params

    def initialize(partner_token:, personal_access_token:, organization_uuid:,
        environment: :production)
      @partner_token = partner_token
      @personal_access_token = personal_access_token
      @organization_uuid = organization_uuid
      @environment = environment
      @default_params = { page: 1, per_page: 100 }
    end

    def domain
      @domain ||= environment == :staging ? 'api.staging.thedeka.com' : '?'
    end

    def url
      @url ||= "https://#{domain}"
    end

    private

    def request(path, params = {})
      conn = Faraday.new(url, request: { timeout: 300_000 })
      conn.authorization :Bearer, personal_access_token

      res = conn.get do |req|
        req.url "/v1/#{path}"
        req.headers['Content-Type'] = 'application/json'
        req.headers['Accept'] = 'application/json'
        req.headers['X-Api-Partner-Token'] = partner_token
        req.options.timeout = 300 # 5 minutes
      end

      raise Deka::Exceptions::ResponseError,
        "#{res.status} #{res.reason_phrase}" unless res.status == 200

      JSON.parse(res.body, symbolize_names: true)
    end
  end
end
