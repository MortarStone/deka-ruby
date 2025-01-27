# frozen_string_literal: true

module Deka
  class ResponseHandler
    attr_accessor :http_response

    def initialize(http_response)
      @http_response = http_response
    end

    def call
      handle_response
    end

    def response
      @response ||= Response.from_http_response(http_response)
    end

    private

    def handle_response
      case response.code
      when 200..299
        response
      when 400
        raise Deka::Exceptions::BadRequestError.new(response), response.error_message
      when 401
        raise Deka::Exceptions::UnauthorizedError.new(response), response.error_message
      when 403
        raise Deka::Exceptions::ForbiddenError.new(response), response.error_message
      when 404
        raise Deka::Exceptions::NotFoundError.new(response), response.error_message
      when 500
        raise Deka::Exceptions::ResponseError.new(response), response.error_message
      else
        raise Deka::Exceptions::DStandardError.new(response), response.error_message
      end
    end
  end
end
