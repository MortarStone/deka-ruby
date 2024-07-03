module Deka
  module Exceptions
    class DStandardError < StandardError
    end

    class UnableToConnectError < DStandardError
    end

    class UnknownConnectingError < DStandardError
    end

    class BadCredentialsError < DStandardError
    end

    class MissingPermissionsError < DStandardError
    end

    class TooManyRequestsError < DStandardError
    end

    class ApiRateLimitError < DStandardError
    end

    class ResponseError < DStandardError
    end

    class NotFoundError < DStandardError
    end
  end
end
