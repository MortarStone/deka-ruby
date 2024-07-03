# frozen_string_literal: true

module Deka
  class ResponseHandler
    attr_accessor :response

    def initialize(response)
      @response = response
    end

    def call
      handle_response
    end

    private

    def handle_response
      case response.status
      when 200..201
        format_response
      when 202..299
        nil # nothing to do
      when 400
        raise Deka::Exceptions::BadRequestError, error_message
      when 401
        raise Deka::Exceptions::UnauthorizedError, error_message
      when 403
        raise Deka::Exceptions::ForbiddenError, error_message
      when 404
        raise Deka::Exceptions::NotFoundError, error_message
      when 500
        raise Deka::Exceptions::ResponseError, error_message
      end
    end

    def error_message
      "#{response.status} #{response.reason_phrase}"
    end

    def format_response
      results = JSON.parse(response.body, symbolize_names: true)
      results[:headers] = response.headers
      results
    end
  end
end
