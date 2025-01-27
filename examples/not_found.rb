require_relative 'helper'

response = @client.user(100_000_000)
print_user(response)
