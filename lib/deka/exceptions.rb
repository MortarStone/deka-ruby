module Deka
  module Exceptions
    class DStandardError < StandardError
    end

    class InvalidInputError < DStandardError
    end

    class ConnectionError < DStandardError
    end

    class ResponseError < DStandardError
    end
  end
end
