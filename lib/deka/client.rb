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
      response = connection.get do |req|
        req.url format_request(path, params)
        req.headers['Content-Type'] = 'application/json'
        req.headers['Accept'] = 'application/json'
        req.options.timeout = 300 # 5 minutes
      end

      ResponseHandler.new(response).call
    end

    def format_request(path, params = {})
      "/v1/#{path}?#{format_get_params(params)}"
    end

    def format_get_params(params = {})
      return if params.empty?

      arr = params.map do |k, v|
        "#{k}=#{v}"
      end
      arr.join('&')
    end
  end
end
