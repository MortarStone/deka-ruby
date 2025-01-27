require "#{File.dirname(__FILE__)}/auto_load"

module Deka
  class Client
    include Deka::Endpoints::Families
    include Deka::Endpoints::Organizations
    include Deka::Endpoints::Purposes
    include Deka::Endpoints::Transactions
    include Deka::Endpoints::Users

    attr_accessor :personal_access_token, :organization_uuid, :environment

    def initialize(personal_access_token:, organization_uuid:, environment:)
      @personal_access_token = personal_access_token
      @organization_uuid = organization_uuid
      @environment = environment || 'production'
    end

    def domain
      @domain ||= environment == 'staging' ? 'api.staging.thedeka.com' : 'api.deka.solutions'
    end

    def url
      @url ||= "https://#{domain}"
    end

    private

    def connection
      @connection ||= Faraday.new(url, request: { timeout: 300_000 }) do |conn|
        conn.request :authorization, 'Bearer', personal_access_token
      end
    end

    def request(path, params = {})
      http_response = connection.get do |req|
        req.url "/v1/#{path}"
        req.params = params
        req.headers['Content-Type'] = 'application/json'
        req.headers['Accept'] = 'application/json'
        req.options.timeout = 300 # 5 minutes
      end

      ResponseHandler.new(http_response).call
    end
  end
end
