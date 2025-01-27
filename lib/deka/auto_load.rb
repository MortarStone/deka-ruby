require 'faraday'
require 'json'

require_relative 'response'
require_relative 'response_handler'

Dir[File.join(__dir__, 'endpoints', '*.rb')].each { |file| require file }
