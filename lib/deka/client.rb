require "#{File.dirname(__FILE__)}/auto_load"

module Deka
  class Client
    include Deka::Endpoints::Families
    include Deka::Endpoints::Organizations
    include Deka::Endpoints::Purposes
    include Deka::Endpoints::Transactions
    include Deka::Endpoints::Users

    attr_accessor :partner_token, :personal_access_token, :organization_uuid,
      :environment

    def initialize(partner_token:, personal_access_token:, organization_uuid:,
        environment: :production)
      @partner_token = partner_token
      @personal_access_token = personal_access_token
      @organization_uuid = organization_uuid
      @environment = environment
    end

    def domain
      @domain ||= environment == :staging ? 'api.staging.thedeka.com' : '?'
    end

    def url
      @url ||= "https://#{domain}"
    end

    private

    def connection
      @connection ||= begin
        conn = Faraday.new(url, request: { timeout: 300_000 })
        conn.authorization :Bearer, personal_access_token
        conn
      end
    end

    def request(path, params = {})
      res = connection.get do |req|
        req.url format_request(path, params)
        req.headers['Content-Type'] = 'application/json'
        req.headers['Accept'] = 'application/json'
        req.headers['X-Api-Partner-Token'] = partner_token
        req.options.timeout = 300 # 5 minutes
      end

      raise Deka::Exceptions::ResponseError,
        "#{res.status} #{res.reason_phrase}" unless res.status == 200

      results = JSON.parse(res.body, symbolize_names: true)
      results[:headers] = res.headers
      results
    end

    def format_request(path, params = {})
      "/v1/#{path}?#{format_get_params(params)}"
    end

    def format_get_params(params = {})
      return if params.blank?

      arr = []
      params.each do |k, v|
        arr << "#{k}=#{v}"
      end
      arr.join('&')
    end
  end
end
